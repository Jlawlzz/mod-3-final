class SearchController < ApplicationController

  def index
    @products = Product.search(params[:product][:search])
    binding.pry
  end
end
