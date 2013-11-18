class ReservationMailer < ActionMailer::Base
  default from: "Reservester <app19024275@heroku.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reservation_mailer.reservation_notification.subject
  #
  def reservation_notification(reservation)
    @reservation = reservation
    @email = reservation.email
    @restaurant = Restaurant.find_by(id: @reservation[:restaurant_id])
    mail( to: @email, subject: "Thanks for making a reservation through Reservester!")
  end
end
