class ProtocolEntityPostCommunity2 < ProtocolEntity2
  PREFIX = '0c'

  BITTORENT_V1_NETWORK_CODE = "01"
  
  attr_reader :community_name
  attr_reader :post_body

  def decode_entity(cmd, payload)
    raise ProtocolParserFactory::ProtocolParserError if cmd != ProtocolEntity2::OP_PREFIX + PREFIX

    

    arg1unpacked = [@args.first].pack('H*')
    arg2unpacked = [@args.second].pack('H*')

    return unless arg1unpacked.force_encoding(Encoding::UTF_8).valid_encoding? and arg2unpacked.force_encoding(Encoding::UTF_8).valid_encoding?	

    # BitTorrent extension for original Memo protocol

    # If payload contains network code and content hash, proceed to decoding
    supposed_p2p_network_id = @args&.third.to_s
    
    if supposed_p2p_network_id == BITTORENT_V1_NETWORK_CODE
      @p2p_network_id = supposed_p2p_network_id
      supposed_info_hash = @args&.fourth.to_s
      
      if supposed_info_hash.length == 40
        @info_hash = supposed_info_hash
      end
    end
    
    @comm = arg1unpacked
    @post_body = arg2unpacked
    {
        community_name: @comm,
        post_body: @post_body,
        info_hash: @info_hash,
        p2p_network_id: @p2p_network_id
    }
  end

  def self.from_entity(entity, created_by_address)
    payload = ProtocolParserFactory::hex_params_to_hex_payload(
        [
            ProtocolParserFactory::utf8_to_hex(entity[:community_name]),
            ProtocolParserFactory::utf8_to_hex(entity[:post_body])
        ]
    )
    return ProtocolEntityPostCommunity2.new(ProtocolEntity2::OP_PREFIX + PREFIX, payload, created_by_address)
  end

  def self.create_and_attach_hashtags(txhash, hashtags)
    hashtags.each do |hashtag|
      cleaned_hashtag = hashtag.gsub('#', '')
      AddressHashtag.find_or_create_by!(:hashtag => cleaned_hashtag)
      AddressPostHashtagMapping.find_or_create_by(:post_tx_id => txhash,
                                                  :hashtag => cleaned_hashtag)
    end
  end

  def get_params
    [@comm, @post_body, @info_hash, @p2p_network_id]
  end

  def get_complete_command
    return ProtocolEntity2::OP_PREFIX + PREFIX
  end

  def do_populate_domain!(block_id, block_time, is_mempool = false)
    if block_id.blank? || block_time.blank?
      raise ProtocolEntity2::DomainError.new
    end

    ## Insvestigate the spiritual meaning of this code :TODO:
    
    if @post_body.blank? || @post_body.blank?
      return
    end

    if @comm.blank? || @comm.blank?
      return
    end

    ## end of spiritual code

    address = ProtocolEntity2.get_address_ident(@created_by_address)

    entity = AddressPost.find_or_create_by!(:address_id => @created_by_address, :action_tx => @txhash)
    entity.action_tx = @txhash
    entity.action_tx_block_id = block_id
    entity.action_tx_is_mempool = 0
    entity.post_body = @post_body
    entity.info_hash = @info_hash
    entity.p2p_network_id = @p2p_network_id
    entity.community = @comm
    entity.post_created_at = block_time
    begin
      entity.save
    rescue => e
      # skip error Incorrect string value: '\xA46\x16\xE6\xE6\xF7...' for colum
    end

    
    # Get hash tags and create them if needed, then link them
    
    unless @post_body.nil?
      hashtags = @post_body.scan(/#\w+/).flatten.select{|hashtag| hashtag.length < 20}
      unless hashtags.empty?
        ProtocolEntityPost2.create_and_attach_hashtags(@txhash, hashtags)
      end
    end
  end
end
