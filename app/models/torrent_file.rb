class TorrentFile < ActiveRecord::Base
  belongs_to :torrent, foreign_key: :torrent_info_hash
end
