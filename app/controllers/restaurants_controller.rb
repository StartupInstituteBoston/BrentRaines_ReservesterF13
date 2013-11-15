class RestaurantsController < ApplicationController

  before_action :authenticate_user!
  before_action :user_signed_in?, only: [:new, :create, :destroy]
  before_action :correct_user?, only: [:edit, :update, :destroy]

  def index
    @restaurants = Restaurant.order(:name)
  end

  def show
    @restaurant = Restaurant.find_by(id: params[:id])
  end

  def new
    if user_signed_in?
      @restaurant = Restaurant.new
    else
      redirect_to root_path
    end
  end

  def create
    @restaurant = current_user.restaurants.build(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant
    else
      render 'new'
    end
  end

  def edit
    @restaurant = Restaurant.find_by(id: params[:id])
  end

  def update
    @restaurant = Restaurant.find_by(id: params[:id])
    if @restaurant.update_attributes(restaurant_params)
      redirect_to @restaurant
    else
      render 'edit'
    end
  end

  def destroy
    Restaurant.find_by(id: params[:id]).destroy
    redirect_to restaurants_path
  end

  private

    def restaurant_params
      params.require(:restaurant).permit(:name, :description, :street, :city, :state, :zip,
                                 :phone, :photo, :photo_url, :menu, :menu_url)
    end

    def correct_user?
      @restaurant = current_user.restaurants.find_by(id: params[:id])
      redirect_to root_url if @restaurant.nil?
    end

end
