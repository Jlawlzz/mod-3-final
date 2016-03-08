class Product < ActiveRecord::Base

  def self.search(params)
    result = BestbuyService.new.search(params)
    products = JSON.parse(result.body)['products']
    products
  end

end
