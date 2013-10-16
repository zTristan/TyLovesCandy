class VideosController < UploadsController

  def index
    @videos = Video.all
  end

  def show
    @video = Video.find(params[:id])
  end

end