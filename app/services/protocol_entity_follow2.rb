class ProtocolEntityFollow2 < ProtocolEntity2
  PREFIX = '06'

#  def decode_entity(cmd, payload)
#    raise ProtocolParserFactory::ProtocolParserError if cmd != ProtocolEntity2::OP_PREFIX + PREFIX

#    arg1unpacked = [@args.first].pack('H*')
#    @follow_address = Cashaddress.from_legacy(arg1unpacked).gsub('bitcoincash:', '')
#    {
#        follow_address: @follow_address
#    }
#  end

  def decode_entity(cmd, payload)
    raise ProtocolParserFactory::ProtocolParserError if cmd != ProtocolEntity2::OP_PREFIX + PREFIX

    arg1unpacked = @args.first#].pack('H*')

    p "args first is #{@args.first}"
    p "Supposed hash160address is #{arg1unpacked}"

    p arg1unpacked.length / 2
    ##
    # suppose we have a HASH 160 arg1unpacked (memo style):

    hash160address = @args.first

    hash160address_bytes = hash160address.chars.each_slice(2).to_a.map{|f,s| (f + s) }.map{|e| e.to_i(16)}
    # @follow_address = Cashaddress.make_cashaddress(1, hash160address.bytes, true)
    # p "Supposed memo address is #{@follow_address}"

    # :TODO: check payload size 
    old_address = Cashaddress.make_old_address(hash160address_bytes, 0x00)

    
    @follow_address = Cashaddress.from_legacy(old_address).gsub('bitcoincash:', '')
    p "Legacy address is #{old_address}"
    # @follow_address3 = Cashaddress.to_legacy(@follow_address2)
    # p "Supposed memo address3 is #{@follow_address3}"
    
    ##
    
    ##
    # blockpress style
    # if arg1unpacked[0..11] == 'bitcoincash:'
    #   @follow_address = arg1unpacked.gsub('bitcoincash:', '')
    # elsif arg1unpacked.first == '1'
    #   @follow_address = Cashaddress.from_legacy(arg1unpacked).gsub('bitcoincash:', '')
    # else
    #   raise "Invalid payload"
    # end
    #
    
    {
        follow_address: @follow_address
    }
  end

  def get_complete_command
    return ProtocolEntity2::OP_PREFIX + PREFIX
  end

  def self.from_entity(entity, created_by_address)
    legacy = Cashaddress.to_legacy('bitcoincash:' + entity[:follow_address])
    payload = ProtocolParserFactory::hex_params_to_hex_payload(
        [
            ProtocolParserFactory::utf8_to_hex(legacy),
        ]
    )
    return ProtocolEntityFollow2.new(ProtocolEntity2::OP_PREFIX + PREFIX, payload, created_by_address)
  end


  def get_params
    [@follow_address]
  end

  def do_populate_domain!(block_id, block_time, is_mempool)
    if block_id.blank? || block_time.blank?
      raise ProtocolEntity2::DomainError.new
    end

    address = ProtocolEntity2.get_address_ident(@created_by_address)
    following_address = ProtocolEntity2.get_address_ident(@follow_address)

    # 000000000000000000a1a8ef2a6bb8f8d0b368b6ab456c7d07cfe583a88c4585
    entity = AddressFollowing.find_or_initialize_by(:follower_address_id => address.address_id,
                                                    :following_address_id => following_address.address_id)
    if entity.action_tx_block_id.blank? || block_id >= entity.action_tx_block_id
      entity.action_tx = @txhash
      entity.action_tx_block_id = block_id
      entity.action_tx_is_mempool = 0
      entity.deleted = 0
      entity.save!
    end
  end
end
