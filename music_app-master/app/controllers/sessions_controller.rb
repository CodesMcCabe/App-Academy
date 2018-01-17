class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_credentials(user_params)
    if @user
      @user.reset_session_key!
      login(@user)
      redirect_to user_url(@user.id)
    else
      flash.now[:creds] = "Invalid credentials"
      render :new
    end
  end

  def destroy
    current_user.reset_session_key!
    session[:session_key] = nil
    redirect_to new_session_url
  end
end
