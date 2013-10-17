class SessionsController < ApplicationController

  def index
    redirect_to :action => :destroy
  end

  def new
  end

  def create
    if env["omniauth.auth"]
      user = User.from_omniauth(env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      user = User.find_by(email: params[:email].downcase)
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_url, :notice => "Logged in!"
      else
        flash.now.alert = "Invalid email or password"
        render "new"
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end