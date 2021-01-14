class ProtocolEntityPostReply2 < ProtocolEntity2
  PREFIX = '03'

  def decode_entity(cmd, payload)
    raise ProtocolParserFactory::ProtocolParserError if cmd != ProtocolEntity2::OP_PREFIX + PREFIX

    @reply_to_tx_id = @args.first

    @reply_to_tx_id_big_endian =  @reply_to_tx_id.chars.each_slice(2).map{|f,s| f + s}.reverse.join

    puts <<-S 
                  @reply_to_tx_id is #{@reply_to_tx_id}. called from #{self.class}
       @reply_to_tx_id_big_endian is #{@reply_to_tx_id_big_endian}. called from #{self.class}
      S
    
    raise ProtocolEntity2::DomainError.new if @reply_to_tx_id.length != 64
    arg2unpacked = [@args.second].pack('H*')
    @post_body = arg2unpacked
    {
        post_body: @post_body,
        reply_to_tx_id: @reply_to_tx_id_big_endian,
    }
  end


  def get_complete_command
    return ProtocolEntity2::OP_PREFIX + PREFIX
  end

  def self.from_entity(entity, created_by_address)
    payload = ProtocolParserFactory::hex_params_to_hex_payload(
        [
            entity[:reply_to_tx_id],
            ProtocolParserFactory::utf8_to_hex(entity[:post_body])
        ]
    )
    return ProtocolEntityPostReply2.new(ProtocolEntity2::OP_PREFIX + PREFIX, payload, created_by_address)
  end

  def get_params
    [@reply_to_tx_id_big_endian, @post_body]
  end


  def do_populate_domain!(block_id, block_time, is_mempool)
    if block_id.blank? || block_time.blank?
      raise ProtocolEntity2::DomainError.new
    end

    if @reply_to_tx_id_big_endian.blank? || @reply_to_tx_id_big_endian.length != 64
      raise ProtocolEntity2::DomainError.new
    end

    address = ProtocolEntity2.get_address_ident(@created_by_address)

    begin
      entity = AddressPost.find_or_create_by!(:address_id => @created_by_address, :action_tx => @txhash)
      entity.action_tx = @txhash
      entity.action_tx_block_id = block_id
      entity.action_tx_is_mempool = 0
      entity.reply_to_tx_id = @reply_to_tx_id_big_endian
      entity.post_body = @post_body
      entity.post_created_at = block_time
      entity.save!
    rescue => e
      puts 'exception reply2' + e.to_s
      # skip error Incorrect string value: '\xA46\x16\xE6\xE6\xF7...' for colum
    end
    # Get hash tags and create them if needed, then link them
    hashtags = @post_body.scan(/#\w+/).flatten
    ProtocolEntityPost2.create_and_attach_hashtags(@txhash, hashtags)
  end

end
