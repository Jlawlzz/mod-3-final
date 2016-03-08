class Product < ActiveRecord::Base

  def self.search(params)
    result = BestbuyService.new.search(params)
    products = JSON.parse(result.body)['products']
    skus = products.map {|product| product['sku']}
    reviews = BestbuyService.new.fetch_reviews(skus)
    binding.pry
  end

end
