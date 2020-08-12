class API::SessionsController < API::BaseController
  include ActionController::Cookies
  include ActionController::RequestForgeryProtection

  # protect_from_forgery with: :exception

  # POST /api/session
  def create
    user = User.find_by(username: session_params[:username])
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      render json: user.slice(:username), status: :created
    else
      render json: {error: 'Invalid credentials'}, status: :unauthorized
    end
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
