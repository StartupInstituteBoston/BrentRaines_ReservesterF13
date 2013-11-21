require 'spec_helper'

describe ReservationsController do
  let!(:restaurant) { create(:restaurant) }

  describe "#create" do
    let(:reservation_attrs) { attributes_for(:reservation, restaurant_id: restaurant.id) }

    it "should redirect to restaurant page" do
      post :create, reservation: reservation_attrs, restaurant_id: restaurant.id
      expect(response).to redirect_to(restaurant_path(restaurant))
    end
  end

  describe "#destroy" do
    let(:reservation) { create(:reservation, restaurant_id: restaurant.id) }

    it "should delete the reservation" do
      delete :destroy, id: reservation.id, restaurant_id: restaurant.id
      expect(response).to redirect_to(restaurant_path(restaurant.id))
    end
  end

end
