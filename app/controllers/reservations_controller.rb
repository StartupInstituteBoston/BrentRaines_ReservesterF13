class ReservationsController < ApplicationController

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to restaurants_path
      flash[:success] = "Reservation successfully created!"
    else
      flash[:error] = "There was an error, please try again."
    end
  end


  private

    def reservation_params
      params.require(:reservation).permit(:email, :time, :comment)
    end

end
