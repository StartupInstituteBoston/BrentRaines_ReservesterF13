require 'spec_helper'

describe "Restaurants" do

  subject { page }

  describe "Index page" do
    before  { visit restaurants_path }

    it { should have_content("Restaurants") }
    it { should have_title("Restaurants") }

    it { should have_link("Add New Restaurant", href: new_restaurant_path) }

  end

  describe "New page" do
    before { visit new_restaurant_path }

    it { should have_content("Add a new restaurant") }
    it { should have_title("New Restaurant") }

  end

  describe "Edit page" do

  end

  describe "Show page" do

  end

end
