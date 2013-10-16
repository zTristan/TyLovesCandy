class PhotosController < UploadsController

  def index

    @sort = params[:sort] | :created_at
    @photos = Photo.desc(@sort)
    @photos.where(:category_id => params[:category_id]) if params[:category_id]

    @category = Category.photo_categories

  end
  
  def show
    @photo = Photo.find(params[:id])
  end

end
