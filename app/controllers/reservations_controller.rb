class ReservationsController < ApplicationController

  def create
    @restaurant = Restaurant.find_by(id: params[:restaurant_id])
    @reservation = @restaurant.reservations.build(reservation_params)
    if @reservation.save
      flash[:success] = "Reservation successfully created!"
      redirect_to restaurants_path
    else
      flash[:error] = "There was an error, please try again."
      redirect_to restaurant_path(@restaurant)
    end
  end

  def destroy
    @reservation = Reservation.find_by(id: params[:id])
    @restaurant_id = @reservation[:restaurant_id]
    @reservation.destroy
    redirect_to restaurant_path(@restaurant_id)
  end

  private

    def reservation_params
      params.require(:reservation).permit(:email, :time, :comment)
    end

end
