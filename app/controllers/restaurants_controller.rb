class RestaurantsController < ApplicationController

	before_action :require_login, only: [:new,:create]
	before_action :require_current_user, only: [:update,:edit,:destroy, :delete]

	def new
		@restaurant = Restaurant.new
	end

	def index
		@restaurants = Restaurant.all
	end

	def create
		@owner = current_user
		@restaurant = @owner.restaurants.create(restaurant_params)

		if @restaurant.save
			redirect_to @restaurant
		else
			render 'new'
		end
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		@owner = @restaurant.user
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])

		if @restaurant.update(restaurant_params)
			redirect_to @restaurant
		else
			render 'edit'
		end
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy

		redirect_to restaurants_path
	end

	private
	def restaurant_params
		params.require(:restaurant).permit(:name,:description,:address, :city, :zipcode, :state, :phone)
	end

	def require_login
		unless logged_in?
			flash[:alert] = "You must be logged in to perform this action."
			redirect_to login_path
		end
	end
	def require_current_user
		@restaurant = Restaurant.find(params[:id])
		unless current_user == @restaurant.user
			flash[:alert] = "You must be the restaurant's owner to perform this action."
			if !logged_in?
				redirect_to login_path
			end
		end
	end
end
