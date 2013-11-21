require 'spec_helper'

describe "User Pages" do

  before { visit root_path }
  subject { page }

  context "with owner signed in" do

    let(:owner) { create(:user) }
    let!(:restaurant) { create(:restaurant, user_id: owner.id) }
    before { sign_in owner }

    describe "owner dashboard" do
      # it { should have_link(restaurant_path(restaurant), restaurant.name) }
    end
  end

  context "with owner signed in" do

    it { should have_content("Sign in") }
  end
end