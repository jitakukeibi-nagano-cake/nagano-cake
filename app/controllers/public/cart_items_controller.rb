class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def create
    cart_item = CartItem.new(cart_item_params)#フォームから送られてきた新しいパラメータ
    cart_item.customer_id = current_customer.id#cart_itemのcustomer_idに現在ログインしているcustomerのidを代入
    if CartItem.find_by(item_id: cart_item.item_id)#CartItemのitem_idがcart_itemのitem_idに一致するものを探し、一致したならtrue、一致しないならfalse
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item] [:item_id])
      cart_item.quantity = cart_item.quantity + params[:cart_item][:quantity].to_i
      cart_item.save
      redirect_to cart_items_path
    else
      cart_item.save
      redirect_to cart_items_path
    end
  end

  def index
    @customer = current_customer
    @cart_items = current_customer.cart_items.all
    @total = 0
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end


  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path
  end

  private
    def cart_item_params
      params.require(:cart_item).permit(:item_id, :quantity)
    end

end
