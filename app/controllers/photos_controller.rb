class PhotosController < UploadsController
  respond_to :html, :json
  before_filter :check_for_user, :only => [:update]

  def index
    @photos = Photo.all
  end
  
  def show
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update_attributes(params[:photo])
    @photo.save
    respond_with @photo
  end

end
