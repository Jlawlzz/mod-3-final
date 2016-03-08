class Api::V1::ItemsController < ApplicationController

  respond_to :json

  def index
    @items = Item.all

    respond_with @items
  end

  def show
    @item = Item.find(params[:id].to_i)

    respond_with @item
  end

  def destroy
    @item = Item.destroy(params[:id])

    @item.destroy

    respond_with @item
  end
end
