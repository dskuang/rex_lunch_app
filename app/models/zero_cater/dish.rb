module ZeroCater
  class Dish
    attr_reader :url

    def initialize(url)
      @url = url
    end

    def fetch
      JSON.parse(API::Request.get(url: url), OpenStruct)
    end
  end
end
