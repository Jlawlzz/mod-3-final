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
    @connection.get("products(search=#{param})?format=json&show=sku,name,shortDescription,salePrice,image,reviews&apiKey=#{ENV['bestbuy_key']}")
  end

  def fetch_reviews(skus)
    @connection.get("reviews(sku=3142553)?pageSize=2&format=json&show=rating&apiKey=#{ENV['bestbuy_key']}")

  end

end
