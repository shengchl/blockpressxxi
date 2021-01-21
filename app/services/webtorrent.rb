class Webtorrent

  def initialize(params)

    @info_hash = params[:info_hash]

  end

  def fetch_metadata
    req = Faraday.send('get', "http://localhost:1873/#{@info_hash}") do 
      |req| req.headers['Content-Type'] = 'application/json'
    end

    JSON.parse(req.body)
  end

end
