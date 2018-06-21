class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to restaurants_path, notice: 'Welcome, You have successfully signed up!'
    else
      flash.now[:alert] = 'Could not register, try again!'
      render :new
    end
  end
  def show
    @customer = Customer.find(params[:id])
  end
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to root_path, flash: { notice: 'Account deleted!' }
  end
  private
  def customer_params
    params.require(:customer).permit(:user_name,:email,:password,:password_confirmation)
  end
end
