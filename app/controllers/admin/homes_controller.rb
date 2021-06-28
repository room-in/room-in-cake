class Admin::HomesController < ApplicationController
  def top
   @orders = Order.page(params[:page]).per(10)
  end

  private

  def order_params
   params.require(:order).permit(:order_status)
  end

end
