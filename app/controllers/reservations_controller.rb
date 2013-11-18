class ReservationsController < ApplicationController

  before_filter :find_restaurant

  def create
    @reservation = @restaurant.reservations.build(reservation_params)
    if @reservation.save
      flash[:success] = "Reservation successfully created!"
      ReservationMailer.reservation_notification(@reservation).deliver
      redirect_to restaurants_path
    else
      flash[:error] = "There was an error, please try again."
      redirect_to restaurant_path(@restaurant)
    end
  end

  def destroy
    @reservation = @restaurant.reservations.find_by(id: params[:id])
    @reservation.destroy
    redirect_to restaurant_path(@restaurant)
  end

  private

    def reservation_params
      params.require(:reservation).permit(:email, :time, :comment)
    end

    def find_restaurant
      @restaurant = Restaurant.find_by(id: params[:restaurant_id])
    end

end
