require 'spec_helper'

describe ReservationsController do

  describe "#create" do
    let(:res_attrs) { attributes_for(:reservation) }

    it "should respond with 201" do
      post :create, reservation: res_attrs
      expect(response.status).to redirect_to(restaurants_path)
    end
  end

end
