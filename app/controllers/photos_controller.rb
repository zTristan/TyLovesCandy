class PhotosController < UploadsController
  before_filter :check_for_user, :only => [:update]

  def index
    @photos = self.get_uploads(Photo)
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
