class AddressPost < ActiveRecord::Base

  has_one :torrent, foreign_key: :info_hash

  # after_save :create_torrent_entry,  :if => Proc.new { |a| a.info_hash.present? }

  private
  
  def create_torrent_entry
    
    # torrent": {
    #         "timedOut": true,
    #         "p2p_network_id": null,
    #         "info_hash": null,
    #         "files": [{ "name": "2021-01-Decentraliz
    
    Torrent.find_or_create_by(info_hash: self.info_hash)

    # add torrent for fetching and downloading if possible
    w = Webtorrent.new(info_hash: info_hash).fetch_metadata
    # WebtorrentWorker.perform_async(info_hash: info_hash)
     
  end 
       
end
