class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  # Put a "before_filter :authorize, only: [:edit, :new]" on any controller
  # actions you want not to be accessible to someone who's not logged in
  def authorize
  	redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end
end
