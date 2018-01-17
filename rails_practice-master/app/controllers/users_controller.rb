class UsersController < ApplicationController

  def new

  end

  def create
    @users = User.new(user_params)
    if @users.save
      login(@users)
      debugger
      redirect_to links_url
    else
      flash[:errors] = "Invalid user params"
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
