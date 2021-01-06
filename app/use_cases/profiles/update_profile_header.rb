require 'bitcoin'

class Profiles::UpdateProfileHeader < ActiveInteraction::Base

  string :ipfsid
  integer :user_id

  def execute
    user = User.find_by_id(user_id)
    address_cash = user.address_cash

    p = ProtocolEntitySetProfileHeader2.from_entity({
                                        :ipfs => ipfsid
                                       }, address_cash)

    publish_result = Wallets::PublishTx.run!(:user_id => user_id,
                                             :address_cash => address_cash,
                                             :protocol_entity2 => p)
    raise 'error' unless publish_result[:success]
    p.populate_domain!(publish_result[:object]['tx_hash'],
                       BitcoinRpcService.get_block_height['height'],
                       Time.now.to_i,
                       true)
    publish_result.merge({
      :addressCash => address_cash
    })
  end
end


