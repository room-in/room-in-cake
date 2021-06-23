class Admin::OrderItemsController < ApplicationController
def show
 @order = Order.find(params[:id])
end
def updeate
    
end
 private

def order_params
    params.require(:order).permit(:item_id, :order_id, :quantity, :main_price,:make_status)
end
end
