class BestbuyService

  def initialize
    @connection = Faraday.new(url: "https://api.bestbuy.com/v1/products") do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter
    end
  end

  def search(param)
    binding.pry
    @connection.get("(search=#{param})?format=json&show=sku,name,salePrice&apiKey=#{ENV['bestbuy_key']}")
  end

end
