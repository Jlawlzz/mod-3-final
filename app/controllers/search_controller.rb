class SearchController < ApplicationController

  def index
    
    @orders = Order.all
  end
end
