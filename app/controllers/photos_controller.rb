class PhotosController < ApplicationController

  def index
    @photos = Photo.all(:limit => 10)
  end
  
  def show
    @photo = Photo.find(params[:id])
  end

end
