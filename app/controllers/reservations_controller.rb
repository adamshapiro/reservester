class ReservationsController < ApplicationController
	before_action :require_owner, only: [:delete,:destroy]

	def new
	end

	def create
		@restaurant = Restaurant.find_by(params[:restaurant_id])
		@reservation = @restaurant.reservations.create(reservation_params)
		ReservationMailer.reservation_notification(@restaurant.user, @reservation)

		if @reservation.save
			redirect_to @restaurant
			flash[:notice] = "You have successfully made a reservation."
		else
			render 'new'
		end
	end

	def destroy
		@reservation = Reservation.find_by(params[:id])
		@reservation.destroy
		flash[:notice] = "Reservation confirmed."
		redirect_to @restaurant
	end


	private
	def reservation_params
		params.require(:reservation).permit(:email,:date,:time)
	end

	def require_owner
		@restaurant = Restaurant.find_by(params[:restaurant_id])
		unless current_user == @restaurant.user
			flash[:alert] = "You must be the restaurant's owner to perform this action."
			if !logged_in?
				redirect_to login_path
			end
		end
	end
end
