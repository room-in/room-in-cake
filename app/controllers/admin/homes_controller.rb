class Admin::HomesController < ApplicationController
def top
 @orders = Order.page(params[:page]).per(10)
end

private

def order_params
 params.require(:order).permit(:customer_id, :created_at, :name, :quantity, :order_status)
end

end
def items_params
 quantity
end