class ProtocolEntityPost2 < ProtocolEntity2
  PREFIX = '02'

  attr_reader :post_body

  def decode_entity(cmd, payload)
    raise ProtocolParserFactory::ProtocolParserError if cmd != ProtocolEntity2::OP_PREFIX + PREFIX

    arg1unpacked = [@args.first].pack('H*')

    puts 'args first is...' + @args.first
    p 'arg1unpacked is ' + [@args.first].pack('H*') 
    
    @post_body = arg1unpacked
    {
        post_body: arg1unpacked
    }
  end

  def self.from_entity(entity, created_by_address)
    payload = ProtocolParserFactory::hex_params_to_hex_payload(
        [
            ProtocolParserFactory::utf8_to_hex(entity[:post_body])
        ]
    )
    return ProtocolEntityPost2.new(ProtocolEntity2::OP_PREFIX + PREFIX, payload, created_by_address)
  end

  def self.create_and_attach_hashtags(txhash, hashtags)
    hashtags.each do |hashtag|
      cleaned_hashtag = hashtag.gsub('#', '')
      AddressHashtag.find_or_create_by!(:hashtag => cleaned_hashtag.downcase)
      AddressPostHashtagMapping.find_or_create_by(:post_tx_id => txhash,
                                                  :hashtag => cleaned_hashtag.downcase)
    end
  end

  def get_params
    [@post_body]
  end

  def get_complete_command
    return ProtocolEntity2::OP_PREFIX + PREFIX
  end

  def do_populate_domain!(block_id, block_time, is_mempool = false)
    puts 'Populating post...' + @post_body
    if block_id.blank? || block_time.blank?
      raise ProtocolEntity2::DomainError.new
    end

    address = ProtocolEntity2.get_address_ident(@created_by_address)

    entity = AddressPost.find_or_create_by!(:address_id => @created_by_address, :action_tx => @txhash)
    puts "ENTITY IS #{entity.id}, address_id #{@created_by_address}, action_tx #{@txhash}, block_id: #{block_id}, body: #{@post_body}"
    entity.action_tx = @txhash
    entity.action_tx_block_id = block_id
    entity.action_tx_is_mempool = 0
    entity.post_body = @post_body
    entity.post_created_at = block_time

    # p @post_body

    # t = "\x89"

    # puts "#{t} equals #{@post_body.force_encoding(Encoding::UTF_8)}?"
    # t == @post_body
    
    # p t.valid_encoding?
    # p @post_body.force_encoding(Encoding::UTF_8).valid_encoding?

    # skip post if post body is not a valid utf8
    return unless @post_body.force_encoding(Encoding::UTF_8).valid_encoding?
    
    begin
      entity.save
    rescue => e
      puts 'exception' + e.to_s
      # skip error Incorrect string value: '\xA46\x16\xE6\xE6\xF7...' for colum
    end
    # Get hash tags and create them if needed, then link them
    hashtags = @post_body.scan(/#\w+/).flatten
    ProtocolEntityPost2.create_and_attach_hashtags(@txhash, hashtags)
  end
  
end
