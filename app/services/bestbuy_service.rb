class BestBuyService

  def initialize
    @connection = Faraday.new(url: "https://api.bestbuy.com/v1/products")
  end

  def search(param)
    @connection.get("(search=#{param})?format=json&show=sku,name,salePrice&apiKey=#{ENV['bestbuy_key']}")
  end

end
