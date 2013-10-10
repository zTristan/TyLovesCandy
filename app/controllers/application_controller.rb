class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :current_user

  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def check_for_mobile
    session[:mobile_override] = params[:mobile] if params[:mobile]
    prepare_for_mobile if mobile_device?
  end

  def prepare_for_mobile
    prepend_view_path Rails.root + 'app' + 'views_mobile'
  end

  def mobile_device?
    if session[:mobile_override]
      session[:mobile_override] == "1"
    else
      # Season this regexp to taste. I prefer to treat iPad as non-mobile.
      (request.user_agent =~ /Mobile|webOS/) && (request.user_agent !~ /iPad/)
    end
  end
  helper_method :mobile_device?

end
