require 'spec_helper'

describe Reservation do
  let!(:reservation) { create(:reservation) }
  subject { reservation }

  it { should respond_to(:email) }
  it { should respond_to(:time) }
  it { should respond_to(:comment) }
  it { should respond_to(:restaurant) }

  it { should be_valid }

  describe "with no email" do
    before { reservation.email = " " }
    it { should_not be_valid }
  end

  describe "with no time" do
    before { reservation.time = " " }
    it { should_not be_valid }
  end
end
