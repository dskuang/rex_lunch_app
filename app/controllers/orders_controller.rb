class OrdersController < ApplicationController
  def index
    @orders = Order.includes(:restaurant)
                   .order('serviced_at desc')
                   .paginate(page: params[:page], per_page: 30)
  end
end
