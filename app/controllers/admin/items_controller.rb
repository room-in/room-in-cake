class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  
def new
  @newitem = Item.new
  @genres = Genre.all
end
def index
  @items = Item.all
  @genreitem = Genre.all
end
def create
   @item = Item.new(item_params)
  if @item.save
     redirect_to admin_items_path
  else
      @newitem = @item
      @genres = Genre.all
    render :new
  end
end
def show
    @item = Item.find(params[:id])
end

def edit
  @item = Item.find(params[:id])
end

  private
def item_params
   params.require(:item).permit(:image, :name, :text, :genre_id, :sub_price, :status)
end


end
