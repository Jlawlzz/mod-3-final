class ItemsController < ApplicationController

  respond_to :json

  def index
    @items = Item.all

    respond_with @items

  def show
    @item = Item.find(params[:id].to_i)

    respond_with @item
  end
end
