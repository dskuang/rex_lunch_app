class ZeroCaterController < ApplicationController
  def index
    @restaurant = ZeroCater::Restaurant.new.upcoming_restaurant
    @dishes = ZeroCater::Dishes.new(@restaurant.url).parse_data
  end
end
