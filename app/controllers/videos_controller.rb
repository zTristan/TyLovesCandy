class VideosController < UploadsController
  respond_to :html, :json
  before_filter :check_for_user, :only => [:update]

  def index
    @videos = Video.all
  end

  def show
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    @video.update_attributes(params[:video])
    respond_with @video
  end

end