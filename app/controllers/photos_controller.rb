class PhotosController < UploadsController
  before_filter :check_for_user, :only => [:update]

  def index

    @sort = params[:sort] | :created_at
    @photos = Photo.desc(@sort)

    if params[:category] and @category = Category.find(params[:category])
      @photos = @photos.where(:category_id => @category.id) 
    end
  end
  
  def show
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update_attributes(params[:photo])
    respond_with @photo
  end

end
