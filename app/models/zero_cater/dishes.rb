module ZeroCater
  class Dishes
    attr_reader :url, :data

    def initialize(url)
      @url = url
      @data = fetch
    end

    def parse_data
      data['items'].each do |item|
        item['necessary_labels'] = []
        item['labels'].each do |label, value_hash|
          if label == 'gluten' && !value_hash['label']
            item['necessary_labels'] << 'gluten free'
          elsif value_hash['value']
            item['necessary_labels'] << label
          end
        end
      end
    end

    private

    def fetch
      JSON.parse(API::Request.get(url: url))
    end
  end
end
