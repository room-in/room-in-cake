class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
  end

  def confirm
  end

  def create
    render complete
  end

  def complete
  end

end
