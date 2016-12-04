class RestaurantsController < ApplicationController
  def index
  end

  def all
    restaurants = Restaurant.all.order(:name)
    render json: restaurants
  end

  def show
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def update
    restaurant = Restaurant.find(params[:restaurant_id])
    restaurant.update_attributes!(restaurant_options)
    render json: restaurant
  end

  def create
    restaurant = Restaurant.create!(restaurant_options)
    render json: restaurant
  rescue => e
    render json: e.message
  end

  def food_items
    food_items = FoodItem.where(restaurant_id: params[:restaurant_id])
                         .order('side_dish ASC, vegetarian ASC, name DESC')
    render json: food_items
  end

  def search
    restaurants = Restaurant.fuzzy_search(name: params[:name])
    render json: restaurants
  end

  private

  def restaurant_options
    params.require(:restaurant)
          .permit(
            :name,
            :photo_link,
            :url,
            :address_line_1,
            :address_line_2,
            :banner_link
          )
  end
end
