module API
  class Request
    attr_reader :url

    def self.get(arguments = {})
      new(arguments).execute
    end

    def initialize(arguments)
      @url = URI(arguments.fetch(:url))
    end

    def execute
      Net::HTTP.get(url)
    end
  end
end
