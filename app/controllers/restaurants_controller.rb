class RestaurantsController < ApplicationController
	before_action :ensure_logged_in, :only => [:show]

	def index
		@restaurants = Restaurant.search(params[:search])
		@restaurants = if params[:search]
			Restaurant.near(params[:search], 1, units: :km)
		else
			Restaurant.all
		end

		respond_to do |f|
			f.html
			f.js
		end
	end
	def new
		@restaurant = Restaurant.new
	end
	def show
		@restaurant = Restaurant.find(params[:id])
		@reservation = @restaurant.reservations.build
		@nearby_restaurants = @restaurant.nearbys(500, units: :km)
	end
	def edit
		@restaurant = Restaurant.find(params[:id])
	end
	def create
		@restaurant = Restaurant.new(restaurant_params)
		if @restaurant.save
			redirect_to root_path(@restaurant), notice: 'Restaurant Added!'
		else
			render :new
		end
	end
	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy
		redirect_to :back
	end
	def update
		@restaurant = Restaurant.find(params[:id])
		if @restaurant.update_attributes(restaurant_params)
			redirect_to restaurants_path(@restaurant)
		else
			render :edit
		end
	end
	def search
    @restaurants = Restaurant.search(params[:search])
    render @restaurants
  end
	private
	def restaurant_params
			params.require(:restaurant).permit(:name,:address,:description,:capacity);
	end
end
