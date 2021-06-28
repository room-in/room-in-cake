class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @total_price = params[:total_price]
  end

  def index
    orders = Order.all
    cart_items = CartItem.all
    @instances = oreders | cart_items
  end



  def show
    @order = Order.find(params[:id])
    @orderitems = @order.order_items
  end



  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    # ＠oderの持っているIDをorderitemの中に格納する記述
    current_customer.cart_items.each do |cart_item|
      OrderItem.create!(item_id: cart_item.item.id, quantity: cart_item.quantity, main_price: @order.total_price, make_status: 0, order_id: @order.id)
    end
    redirect_to orders_complete_path
    current_customer.cart_items.destroy_all
  end


  def confirm
   @order = Order.new
   @total_price = params[:order][:total_price]
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
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
  end

  private

  def order_param
     params.require(:order).permit(:customer_id, :address, :pay_selection, :postage, :total_price, :order_status)
  end

  def orders_params
    params.require(:order).permit(:pay_selection, :postal_code, :address, :name, :total_price)
  end
  
  
end
