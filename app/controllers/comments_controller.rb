class CommentsController < ApplicationController
  before_filter :check_for_user

  def create
    upload = Upload.find(params[:upload_id])
    comment = upload.comments.new(params[:comment])
    comment.user = @current_user
    comment.save!
    redirect_to upload, :notice => "Comment posted"
  end

end
