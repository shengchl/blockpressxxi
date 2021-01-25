class WebtorrentWorker
  include Sidekiq::Worker

  def perform(info_hash:)
    w = Webtorrent.new(info_hash: info_hash).fetch_metadata
    p "Add torrent with #{info_hash} to webtorrent node"
  end
end
