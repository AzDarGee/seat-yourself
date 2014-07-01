class RestaurantsController < ApplicationController
	def index
		@restaurants = Restaurant.all
	end
  def new
    @restaurant = Restaurant.new
  end
  def create
    @restaurant = Restaurant.new(rest_params)
    if @restaurant.save
      redirect_to root_path, notice: "Added Restaurant"
    else
      render :new
    end
  end
  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to root_path, notice: "Deleted Restaurant"
  end
  def edit
    @restaurant = Restaurant.find(params[:id])
  end
  def show
    @restaurant = Restaurant.find(params[:id])
  end
  private
  def rest_params
    params.require(:restaurant).permit(:image,:name,:address,:summary,:price_range,)
  end
end
