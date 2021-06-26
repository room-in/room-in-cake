class Admin::OrderItemsController < ApplicationController
before_action :authenticate_admin!
def show
 @order = Order_items.find(params[:id])
end
def updeate
    @order = Order_items.find(params[:id])
    @order.update(order_params)
end
 private

def order_params
 params.require(:order_items).permit(:customer_id, :created_at, :postal_code, :pay_selection, :address, :name, :quantity, :order_status, :postage, :total_price)
end
end
def items_params
params.require(:items).permit(:items, :sub_price)
end