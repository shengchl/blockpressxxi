class AddressPost < ActiveRecord::Base

  after_save :create_torrent_entry,  :if => Proc.new { |a| a.info_hash.present? }

  private
  
  def create_torrent_entry
    
    # torrent": {
    #         "timedOut": true,
    #         "p2p_network_id": null,
    #         "info_hash": null,
    #         "files": [{ "name": "2021-01-Decentraliz
    
    t = Torrent.find_or_create_by(info_hash: self.info_hash)

    # add torrent for fetching and downloading if possible    
     Webtorrent.new(info_hash: self.info_hash).add_torrent
  end 
       
end
