class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!

  def show
   @order = Order.find(params[:id])
   @order_items = @order.order_items
   # @order_item = @order.order_items.all
  end

  def update
      @orderItem = OrderItem.find(params[:id])
      @orderItem.update(order_item_params)
      redirect_to admin_order_path(@orderItem.order.id)
  end



   private

  def order_item_params
   params.require(:order_item).permit(:make_status)
  end

  def items_params
  params.require(:items).permit(:items, :sub_price)
  end

end