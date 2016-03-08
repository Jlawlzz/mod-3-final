class Product < ActiveRecord::Base

  def self.search(params)
    BestbuyService.new.search(params)
  end

end
