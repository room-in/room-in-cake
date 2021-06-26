class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer)
    else
      render 'edit'
    end
  end

  def unsubscribe
  end

  def withdraw
    current_customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用をお待ちしております。"
    redirect_to root_path
  end


  private
    def customer_params
        params.require(:customer).permit(:fast_name, :second_name, :kana_fast_name, :kana_second_name, :postal_code, :address, :telephone_number, :email, :is_deleted)
    end
end