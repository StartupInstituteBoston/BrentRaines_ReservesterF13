require 'spec_helper'

describe "Restaurant pages" do

  subject { page }

  describe "Index page" do
    before do
      @restaurant = FactoryGirl.create(:restaurant)
      @restaurant.save
      visit restaurants_path
    end

    it { should have_content("Restaurants") }
    it { should have_title("Restaurants") }

    it { should have_link("Add New Restaurant", href: new_restaurant_path) }
    it { should have_link(@restaurant.name, href: restaurant_path(@restaurant)) }

  end

  describe "New page" do
    before { visit new_restaurant_path }

    it { should have_content("Add a new restaurant") }
    it { should have_title("New Restaurant") }

  end

  describe "Edit page" do
    let(:restaurant) { FactoryGirl.create(:restaurant) }
    before { visit edit_restaurant_path(restaurant) }

    it { should have_title("Edit") }

  end

  describe "Show page" do
    let(:restaurant) { FactoryGirl.create(:restaurant) }
    describe "with valid restaurant" do
      before { visit restaurant_path(restaurant) }

      it { should have_title(restaurant.name) }
    end

  end

  describe "creating a new restaurant"

end
