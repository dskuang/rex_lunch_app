module ZeroCater
  class Restaurant
    attr_reader :url, :data, :dishes

    def initialize
      token = Technology.of_type('zero_cater').last.obtain_data[:token]
      @url = "https://api.zerocater.com/v3/companies/#{token}/meals"
      @data = fetch
    end

    def upcoming_restaurant
      current_restaurants.each do |restaurant|
        catering_days.reverse.each do |date|
          restaurant_date = Time.at(restaurant.time).to_date
          return restaurant if restaurant_date > date && !restaurant.was_delivered
        end
      end
    end

    private

    def fetch
      current_restaurants
    end

    def catering_days
      [monday.to_date, wednesday.to_date, friday.to_date, next_monday.to_date]
    end

    def monday
      Time.now.beginning_of_week
    end

    def wednesday
      monday + 2.days
    end

    def friday
      monday + 4.days
    end

    def next_monday
      monday + 1.week
    end

    def current_restaurants
      restaurants = restaurant_data.select do |restaurant|
        Time.at(restaurant['time']) > Time.now
      end
      restaurants.map { |restaurant| OpenStruct.new(restaurant) }.sort_by(&:time)
    end

    def restaurant_data
      JSON.parse(API::Request.get(url: url), object_class: OpenStruct)
    end
  end
end
