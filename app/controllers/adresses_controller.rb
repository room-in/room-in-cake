class  AdressesController < ApplicationController

  def index
    @adress = Adress.new
    @adresses = current_customer.adresses
  end

  def create
    @adress = Adress.new(adress_params)
    @adress.customer_id = current_customer.id
    if @adress.save
      redirect_to adresses_path(@adress)
    else
      @adresses = current_customer.adresses
      render 'index'
    end
  end

  def destroy
    @adress.destroy
    redirect_to adresses_path
  end

  private
    def adress_params
        params.require(:adress).permit(:postal_code, :delivery, :name)
    end
end
