class ItemsController < ApplicationController
  
  def index
    @items = Item.all

  end
  def show
    @item = Item.find(params[:id])
    @cart_items = CartItem.new
  end

end
