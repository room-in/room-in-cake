class Public::ItemsController < ApplicationController


  def index
    # @items = Item.all
     @items = Item.page(params[:page]).per(8)
    # if params[:status]
    # else
    # end
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
