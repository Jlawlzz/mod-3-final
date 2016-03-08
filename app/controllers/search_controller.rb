class SearchController < ApplicationController

  def index
    @products = Product.search(params['product']['search'])
  end
end
