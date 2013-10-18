class CandiesController < ApplicationController
  before_filter :check_for_user

  def give_candy
    
    upload = Upload.find(params[:upload_id])

    if upload.can_give_candy? @current_user
      Candy.find_or_create_by(:user => @current_user, :upload => Upload.find(params[:upload_id]))
      upload.update_candies
    end

    render :text => 1

  end

end
