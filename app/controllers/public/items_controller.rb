class Public::ItemsController < ApplicationController
  # before_action :authenticate_customer!, only: [:index]

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
