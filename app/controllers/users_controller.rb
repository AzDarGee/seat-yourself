class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to restaurants_path, notice: 'Welcome, You have successfully signed up!'
    else
      flash.now[:alert] = 'Could not register, try again!'
      render :new
    end
  end

  def show

  end
  private
  def user_params
    params.require(:user).permit(:user_name,:email,:password,:password_confirmation)
  end
end
