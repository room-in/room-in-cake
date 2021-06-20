class ItemsController < ApplicationController
  def index
    @items = Item.all
      @index = "商品"
  end
  def show
    @item = Item.find(params[:id])
    @cart_items = CartItem.new
  end
end
