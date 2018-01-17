class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :login, :user_params, :current_user

  def current_user
    # user whose session key is == session[:session key]
    @current_user ||= User.find_by(session_key: session[:session_key])
  end

  def login(user)
    session[:session_key] = user.reset_session_key!
  end

  def logged_in?
    self.session_key == session[:session_key]
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
