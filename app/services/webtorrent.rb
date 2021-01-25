class Webtorrent

  def initialize(params)

    @info_hash = params[:info_hash]

  end

  def fetch_metadata
    req = Faraday.send('get', "http://localhost:1873/#{@info_hash}") do 
      |req| req.headers['Content-Type'] = 'application/json'
    end

    res = JSON.parse(req.body)

    Torrent.find_or_create_by(info_hash: @info_hash)# .update(res)
    res
  end

end
