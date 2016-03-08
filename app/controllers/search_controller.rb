class SearchController < ApplicationController

  def index
    @products = Services::BestBuyService.search(params[:product][:search])
    binding.pry
  end
end
