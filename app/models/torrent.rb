class Torrent < ActiveRecord::Base

  self.primary_key = 'info_hash'
  
  belongs_to :address_post, foreign_key: :info_hash#, optional: true
  has_many :torrent_files, foreign_key: :torrent_info_hash, dependent: :destroy 
end
