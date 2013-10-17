class VideosController < UploadsController
  before_filter :check_for_user, :only => [:update]

  def index
    @sort = params[:sort] | :created_at
    @videos = Video.desc(@sort)

    if params[:category] and @category = Category.find(params[:category])
      @videos = @videos.where(:category_id => @category.id) 
    end
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