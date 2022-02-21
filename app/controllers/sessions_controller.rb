class SessionsController < ApplicationController
  def new
  end 

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password_digest])
      session[:user_id] = user.id 
      flash[:success] = "You are successfully logged in"
      redirect_to root_path
    else 
      flash.now[:error] = "Sorry!!Wrong Login Credentials"
      render 'new'
    end 
  end 

  def destroy
    session[:user_id] = nil
    flash[:success] = "You are successfully logged out"
    redirect_to login_path
  end 
end