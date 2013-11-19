require 'spec_helper'

describe Restaurant do

  before { @restaurant = FactoryGirl.create(:restaurant) }
  subject { @restaurant }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:street) }
  it { should respond_to(:city) }
  it { should respond_to(:state) }
  it { should respond_to(:zip) }
  it { should respond_to(:phone) }
  it { should respond_to(:photo) }
  it { should respond_to(:menu) }
  it { should respond_to(:user) }

  it { should be_valid }

  describe "when name is not present" do
    before { @restaurant.name = " " }
    it { should_not be_valid }
  end

  describe "when user is not present" do
    before { @restaurant.user = nil }
    it { should_not be_valid }
  end

end
