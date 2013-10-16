class CandiesController < ApplicationController
  before_filter :check_for_user

  def give_candy
    Candy.find_or_create_by(:user => @current_user, :upload => Upload.find(params[:upload_id]))
    render :text => 1
  end

end
