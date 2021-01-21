class Webtorrent

  def initialize(params)

    @info_hash = params[:info_hash]

  end

  def add_torrent
    req = Faraday.send('get', "http://localhost:1873/#{@info_hash}") {|req| req.headers['Content-Type'] = 'application/json' }

    JSON.parse(req.body)
  end

end
