class UsersController < ApplicationController  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user].downcase)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Successfully created user."
      redirect_to root_url, :notice => "User created!"
    else
      flash[:error] = @user.errors.full_messages
      render :action => 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated user."
    end
    render :action => 'edit'
  end
end
