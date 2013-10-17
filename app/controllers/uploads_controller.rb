class UploadsController < ApplicationController
  before_filter :check_for_user
  respond_to :html, :json

  UploadLimit = 20
  SortNew = :created_at
  SortCandy = :candy_count

  def get_uploads upload_class
    @category = Category.find(params[:category]) if params[:category]
    @limit  = params[:limit] ? params[:limit] : UploadLimit
    @page = [params[:page].to_i, 0].max
    @sort = params[:sort] ? params[:sort].to_sym : SortCandy
    uploads = upload_class.limit(@limit + 1).offset(@page * @limit).desc(@sort)
    uploads = uploads.where(category_id: @category.id) if @category
    @has_next_page = true if uploads.count(true) > @limit
    @has_prev_page = true if @page > 0
    return uploads
  end

  def index
    @uploads = Upload.where(:user_id => @current_user._id).desc(:created_at)
    @categories_photo = Category.photo_categories_edit
    @categories_video = Category.video_categories_edit
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
      @categories = Category.photo_categories_edit
    elsif content_type.match(/video/)
      @upload = Video.new(params[:upload])
      @categories = Category.video_categories_edit
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
