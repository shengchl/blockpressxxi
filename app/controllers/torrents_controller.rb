class TorrentsController < ApplicationController

  def set_timed_out
    torrent = Torrent.find_or_create_by(info_hash: params[:info_hash])
  end

  def update_content
    torrent = Torrent.find_by(info_hash: params[:info_hash])

    #{"params":{"timedOut":true},"controller":"torrents","action":"update_content","info_hash":"undefined","torrent":{}}

    timed_out = params["timeOut"]
    
    if torrent
      
      if timed_out
        torrent.update(timed_out: true)
      else
        info_hash = params["info_hash"]
        name = params["info_hash"]
        content = params["content"]
        name = params["name"]
        
        torrent.update(timed_out: false, name: name, content: content)
      end
    end
    
    render :json => params
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_torrent
      @torrent = Torrent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def torrent_params
      params.require(:torrent).permit(:timed_out, :info_hash, :file_name, :file_content)
    end
end
