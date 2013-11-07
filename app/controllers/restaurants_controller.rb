class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.order(:name)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant
    else
      render 'new'
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update_attributes(restaurant_params)
      redirect_to @restaurant
    else
      render 'edit'
    end
  end

  def destroy
    Restaurant.find(params[:id]).destroy
    redirect_to restaurants_path
  end

  private

    def restaurant_params
    params.require(:restaurant).permit(:name, :description, :street, :city, :state, :zip,
                                 :phone, :photo, :photo_url, :menu, :menu_url)
    end
end
