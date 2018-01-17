class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # render json: "Thank you for signing up!"
      login(@user)
      redirect_to user_url(@user.id)
    else
      flash.now[:error] = "Please enter a valid UN and password."
      render :new
    end
  end

  def show
    render :show
  end


end
