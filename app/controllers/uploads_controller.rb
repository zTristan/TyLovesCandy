class UploadsController < ApplicationController
  before_filter :check_for_user
  respond_to :html, :json

  def index
    @uploads = Upload.where(:user_id => @current_user._id).desc(:created_at)
  end

  def show
    @upload = Upload.find(params[:id])
  end

  def new
    @upload = Upload.new
  end

  def edit
    @upload = Upload.find(params[:id])
  end

  def create
    content_type = params[:upload][:upload].content_type
    if content_type.match(/image/)
      @upload = Photo.new(params[:upload])
    elsif content_type.match(/video/)
      @upload = Video.new(params[:upload])
    end

    if @upload
      @upload.user = @current_user
      @upload.save
    end
  end

  def update
    @upload = Upload.find(params[:id])
    @upload.update_attributes(params[:upload])
    respond_with @upload
  end

  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy
    redirect_to uploads_url, notice: "File was successfully destroyed."
  end
end
