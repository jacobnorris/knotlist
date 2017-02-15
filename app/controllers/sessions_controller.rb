class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.first #only need one user for now, w/ global password
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to wedding_info_path
    else
      flash.now.alert = "Password is invalid."
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
