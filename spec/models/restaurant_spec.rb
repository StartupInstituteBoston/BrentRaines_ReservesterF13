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

  it { should be_valid }

  describe "when name is not present" do
    before { @restaurant.name = " " }
    it { should_not be_valid }
  end

  describe "when name is already taken" do
    before do
      @invalid_restaurant = @restaurant.dup
    end

    subject { @invalid_restaurant }

    it { should_not be_valid }
  end

  describe "when description is greater than 200 char" do
    before { @restaurant.description = "a"*201 }
    it { should_not be_valid }
  end

  describe "when street is not present" do
    before { @restaurant.street = " " }
    it { should_not be_valid }
  end

  describe "when city is not present" do
    before { @restaurant.city = " " }
    it { should_not be_valid }
  end

  describe "when state is not present" do
    before { @restaurant.state = " " }
    it { should_not be_valid }
  end

  describe "when zip is not present" do
    before { @restaurant.zip = " " }
    it { should_not be_valid }
  end

  describe "when phone is not present" do
    before { @restaurant.phone = " " }
    it { should_not be_valid }
  end

end
