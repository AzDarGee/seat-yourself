class OwnersController < ApplicationController
  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      redirect_to restaurants_path, notice: 'Welcome, You have successfully signed up!'
    else
      flash.now[:alert] = 'Could not register, try again!'
      render :new
    end
  end
  def show
    @owner = Owner.find(params[:id])
  end
  def destroy
    @owner = Owner.find(params[:id])
    @owner.destroy
    redirect_to root_path, flash: { notice: 'Account deleted!' }
  end
  private
    def owner_params
      params.require(:owner).permit(:user_name,:email,:password,:password_confirmation)
    end
end
