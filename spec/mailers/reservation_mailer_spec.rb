require "spec_helper"

describe ReservationMailer do
  describe "reservation_notification" do
    let(:restaurant) { create(:restaurant) }
    let(:reservation) { create(:reservation, restaurant_id: restaurant.id) }
    let(:mail) { ReservationMailer.reservation_notification(reservation) }

    it "renders the headers" do
      mail.subject.should eq("Thanks for making a reservation through Reservester!")
      mail.to.should eq([reservation.email])
      mail.from.should eq(["app19024275@heroku.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("The details of your reservation are below:")
    end
  end

end
