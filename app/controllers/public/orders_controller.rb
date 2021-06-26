class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(orders_params)
    @order.save
    redirect_to orders_complete_path
  end


  def confirm
   @order = Order.new
   @cart_items = current_customer.cart_items
    if params[:order][:pay_selection] == "true"
      @order.pay_selection = true
    else
      @order.pay_selection = false
    end

    if params[:order][:selection] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    elsif params[:order][:selection] == "1"
      adress = Adress.find_by(params[:order][:address_selection])
      @order.postal_code = adress.postal_code
      @order.address = adress.delivery
      @order.name = adress.name
    elsif params[:order][:selection] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:delivery]
      @order.name = params[:order][:name]
    end
  end

  def complete
  end


private
  def orders_params
    params.require(:order).permit(:pay_selection, :postal_code, :address, :name)
  end
end
