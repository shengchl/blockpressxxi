require 'transmission'
require 'fileutils'


class TransmissionService

  def initialize(params)

    @info_hash = params[:info_hash]
    @conn = Transmission.new(Rails.config_for(:transmission).symbolize_keys)
    
    
  end

  def fetch_torrent
    @conn.add_magnet(magnet_link, {'paused' => true})
  end
  
  def download
    FileUtils.mkdir_p("#{Rails.root}/torrent_data/#{@info_hash}")
  end

  def magnet_link
    "magnet:?xt=urn:btih:#{@info_hash}"
  end


end
