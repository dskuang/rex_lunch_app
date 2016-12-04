class FoodItemsController < ApplicationController
  def change_item_lock
    item = FoodItem.find(params[:id])
    item.update_attributes!(disabled: !item.disabled)
    render json: item
  end

  def add
    food_item = FoodItem.create!(food_item_add_options)
    render json: food_item
  end

  def delete
    FoodItem.find(params[:id]).delete
  end

  def update
    food_item = FoodItem.find(params[:id])
    food_item.update_attributes!(food_item_update_options)
    render json: food_item
  end

  private

  def food_item_update_options
    params.require(:food_item)
          .permit(
            :name,
            :photo_link,
            :side_dish,
            :vegetarian,
            :disabled
          )
  end

  def food_item_add_options
    params.require(:food_item)
          .permit(
            :name,
            :photo_link,
            :vegetarian,
            :disabled,
            :side_dish,
            :restaurant_id
          )
  end
end
