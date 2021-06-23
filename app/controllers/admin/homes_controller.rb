class Admin::HomesController < ApplicationController
def 
  @items = Item.page(params[:page]).per(10)
end
end
