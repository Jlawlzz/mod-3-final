require 'net/http'

class BestbuyService

  def initialize
    @connection = Faraday.new(url: "https://api.bestbuy.com/v1") do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end
  end

  def search(param)
    @connection.get("products(search=#{param})?format=json&show=sku,name,shortDescription,salePrice,image&apiKey=#{ENV['bestbuy_key']}")
    binding.pry
  end

end
