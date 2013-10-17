class VideosController < UploadsController
  skip_before_filter :check_for_user

  def index
    @sort = params[:sort] | :created_at
    @videos = Video.desc(@sort)

    if params[:category] and @category = Category.find(params[:category])
      @videos.where(:category_id => @category.id) 
    end
  end

  def show
    @video = Video.find(params[:id])
  end

end