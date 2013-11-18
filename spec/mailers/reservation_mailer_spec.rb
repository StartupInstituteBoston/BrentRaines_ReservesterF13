require "spec_helper"

describe ReservationMailer do
  describe "reservation_notification" do
    let(:mail) { ReservationMailer.reservation_notification }

    it "renders the headers" do
      mail.subject.should eq("Reservation notification")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
