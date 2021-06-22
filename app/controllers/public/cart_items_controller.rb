class Public::CartItemsController < ApplicationController
  def create
  end
  
  def index
  end
  
  def update
  end
  
  def destroy
  end
  
  def destroy_all
  end
  
  
  private

  def cart_items_params
    params.require(:cart_items).permit(:quantity, :item_id)
  end
end
