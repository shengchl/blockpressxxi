class WebtorrentWorker
  include Sidekiq::Worker

  def perform(info_hash:)
    w = Webtorrent.new(info_hash: self.info_hash).fetch_metadata

  end
end
