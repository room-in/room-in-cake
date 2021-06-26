class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  def create
    @item = Item.find(params[:cart_item][:id])
    @cart_item = CartItem.new
    #同じ商品がカートにすでに入っていたら
    #自分自身（ログインしているユーザー）が同じ商品IDが保存されているカートを持っていた場合
    
    #(カート目線)ログインしているユーザーと追加したい商品のIDが保存されているカートが既に存在していた場合
    
    #(カート目線)ログインしているユーザーと追加したい商品のIDが保存されているカートがpresent?
    
    #@ald_cart_item.present?
    @old_cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:id])
    if @old_cart_item.present?
     @old_cart_item.quantity += params[:cart_item][:quantity].to_i
     @old_cart_item.save
    else
     @cart_item.customer_id = current_customer.id
     @cart_item.item_id = @item.id
     @cart_item.quantity = params[:cart_item][:quantity].to_i
     @cart_item.save
    end
      redirect_to cart_items_path
  end
  def index
     # @cart_items = current_customer.cart_items
    @cart_items = CartItem.where(customer_id:current_customer.id)
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.quantity = params[:cart_item][:id]
    @cart_item.update(cart_items_params)
    flash[:success] = '個数を変更しました'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    # cart_items = CartItem.find_by(params[:id], client_id: current_client.id)
    cart_items = CartItem.find(params[:id])
    cart_items.destroy
    flash[:danger] = "カートから削除しました"
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    flash[:alert] = "カートの商品を全て削除しました"
    redirect_to cart_items_path
  end


  private

  def cart_items_params
    params.require(:cart_item).permit(:quantity, :item_id)
  end
end
