class API::BaseController < ActionController::API

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    if current_user.present?
      yield
    else
      render json: {error: "You must be logged in to access this page."}, status: :forbidden
    end
  end
end
