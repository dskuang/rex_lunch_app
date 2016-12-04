class OrderWorker
  ORDERS = ["02/10/16 08:43am", "AG Ferrari Foods - SOMA", "712.29", "02/04/16 12:07pm", "La Mediterranee", "670.93", "02/03/16 09:54am", "Wise Sons - Mission", "780.07", "01/28/16 03:00pm", "Wise Sons - Contemporary Jewish Museum", "717.49", "01/28/16 07:31am", "Mixt Greens", "699.62", "01/26/16 09:17am", "Rosamunde Sausage Grill", "498.68", "01/22/16 08:39am", "Rosamunde Sausage Grill", "706.55", "01/22/16 07:29am", "Brandy Ho's - Hunan", "939.94", "01/18/16 07:59am", "Nopalito - Sunset", "915.79", "01/11/16 10:45am", "Glaze Teriyaki Grill - Fillmore", "733.49", "01/11/16 10:38am", "Panini", "623.34", "01/07/16 03:20pm", "Limon Rotisserie", "791.00"].each_slice(3).to_a

  SKIPPED_LIST = ['Merigan Sub Shop', 'Modern Thai', 'Wise Sons - Contemporary Jewish Museum']

  def call!
    ORDERS.each do |order|
      next if order.second.in?(SKIPPED_LIST)
      Order.create!(parse_order(order))
    end
  end

  def parse_order(order)
    name = order.second
    {
      serviced_at: DateTime.strptime(order.first, "%m/%d/%Y %k:%M"),
      restaurant_id: Restaurant.where("name Ilike ?", "%#{name}%").first.id,
      purchased_amount: order[2].to_f
    }
  end
end
