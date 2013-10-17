class PhotosController < UploadsController
  skip_before_filter :check_for_user

  def index

    @sort = params[:sort] | :created_at
    @photos = Photo.desc(@sort)

    if params[:category] and @category = Category.find(params[:category])
      @photos.where(:category_id => @category.id) 
    end
  end
  
  def show
    @photo = Photo.find(params[:id])
  end

end
