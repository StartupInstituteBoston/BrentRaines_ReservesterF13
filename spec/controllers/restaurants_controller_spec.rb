require 'spec_helper'

describe RestaurantsController do

  let(:restaurant) { create(:restaurant, user: user) }
  let(:user) { create(:user) }
  let(:incorrect_user) { create(:user) }
  before { sign_in(user) }
  
  describe "#index" do
    let(:restaurants) { create_list(:restaurant, 3) }

    it "should assign all restaurants to restaurants variable" do
      get :index
      assigns(:restaurants).should eq restaurants
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "#show" do

    it "should assign restaurant to restaurant variable" do
      get :show, id: restaurant.id
      assigns(:restaurant).should eq restaurant
    end

    it "renders the show template" do
      get :show, id: restaurant.id
      expect(response).to render_template("show")
    end
  end

  describe "#new" do

    context "with signed in user" do
      it "renders the new template" do
        get :new
        expect(response).to render_template("new")
      end
    end

    context "without signed in user" do
      before { sign_out user }
      it "should redirect to sign in page" do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "#create" do

    context "with valid attributes" do
      let(:restaurant_attrs) { attributes_for(:restaurant) }

      it "should save the restaurant" do
        post :create, restaurant: restaurant_attrs
        expect(response.status).to eq(302)
      end
    end

    context "with invalid attributes" do
      let(:restaurant_attrs) { attributes_for(:restaurant, name: " ") }

      it "renders the new template" do
        post :create, restaurant: restaurant_attrs
        expect(response).to render_template("new")
      end
    end

    context "without a signed in user" do
      let(:restaurant_attrs) { attributes_for(:restaurant, name: " ") }
      before { sign_out user }

      it "should redirect to sign in page" do
        post :create, restaurant: restaurant_attrs
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "#edit" do

    context "with the correct user" do

      it "renders the edit template" do
        get :edit, id: restaurant.id
        expect(response).to render_template("edit")
        expect(response.status).to eq(200)
      end
    end

    context "with the incorrect user" do
      before do
        sign_out user
        sign_in incorrect_user
      end

      it "should redirect to root" do
        get :edit, id: restaurant.id
        expect(response).to redirect_to(root_url)
      end
    end
  end

  describe "#update" do
    let(:restaurant_attrs) { attributes_for(:restaurant, name: "Sample Restaurant", user: user) }

    context "with the correct user" do

      it "should save the restaurant" do
        patch :update, id: restaurant.id, restaurant: restaurant_attrs
        expect(response.status).to eq(302)
      end
    end

    context "with the incorrect user" do
      before do
        sign_out user
        sign_in incorrect_user
      end
      it "should redirect to root" do
        patch :update, id: restaurant.id, restaurant: restaurant_attrs
        expect(response).to redirect_to(root_url)
      end
    end
  end

  describe "#destroy" do

    context "with the correct user" do
      it "should delete the restaurant record" do
        delete :destroy, id: restaurant.id
        expect(Restaurant.find_by(id: restaurant.id)).to be_nil
      end
    end

    context "with the incorrect user" do
      before do
        sign_out user
        sign_in incorrect_user
      end

      it "should redirect to root" do
        delete :destroy, id: restaurant.id
        expect(response).to redirect_to(root_url)
      end
    end
  end

end