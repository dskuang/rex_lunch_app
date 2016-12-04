class EmailsController < ApplicationController
  def index
    @restaurants = Restaurant.order(:name).map { |r| [r.name, r.id] }
  end

  def preview
    @restaurant = Restaurant.includes(:food_items).find(params[:id])
    @time = manual_time
    render 'user_mailer/send_lunch_email', layout: false
  end

  def send_email
    restaurant = Restaurant.includes(:food_items).find(params[:id])
    UserMailer.send_lunch_email(restaurant, manual_time).deliver
    Order.create!(restaurant_id: restaurant.id, serviced_at: Time.current)
    render json: 'ok'
  end

  private

  def manual_time
    if params[:time].present?
      DateTime.strptime(params[:time], "%m/%d/%Y")
              .strftime('%A, %B %e')
    end
  end
end
