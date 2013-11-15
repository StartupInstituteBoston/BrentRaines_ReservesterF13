require 'spec_helper'

describe "Restaurant pages" do

  before { visit root_path }
  subject { page }

  describe "for guest" do
    describe "should display sign in page" do
      it { should have_content("Sign in") }
    end
  end

  context "for signed-in user" do
    let(:user) { create(:user) }
    let!(:restaurant) { create(:restaurant, user: user) }

    before do
      sign_in user
      visit restaurants_path
    end

    describe "index page" do
      before { visit restaurants_path }

      it { should have_content("Restaurants") }
      it { should have_title("Restaurants") }

      it { should have_link("Add New Restaurant", href: new_restaurant_path) }
      it { should have_link(restaurant.name, href: restaurant_path(restaurant)) }

    end

    describe "new page" do
      before { visit new_restaurant_path }

      it { should have_selector('h1', text: "Add a new restaurant") }
      it { should have_title("New Restaurant") }

    end

    describe "edit page" do

      before { visit edit_restaurant_path(restaurant) }
      it { should have_title("Edit") }
    end

    describe "show page" do

      describe "with valid restaurant" do
        before { visit restaurant_path(restaurant) }

        it { should have_title(restaurant.name) }
        it { should have_content(restaurant.user.first_name + " " + 
                                 restaurant.user.last_name) }
      end
    end
  end

end
