class Admin::ItemsController < ApplicationController
def new
  @newitem = Item.new
  @genres = Genre.all
end
def index
  @items = Item.page(params[:page]).per(10)
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
  @genres = Genre.all
end

  private
def item_params
   params.require(:item).permit(:image, :name, :text, :genre_id, :sub_price, :status)
end


end
