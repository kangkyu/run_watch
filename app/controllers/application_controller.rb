class ApplicationController < ActionController::Base

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def require_user
    unless current_user
      flash[:notice] = "You must be logged in to access this page."
      redirect_to login_url
    end
  end
end
