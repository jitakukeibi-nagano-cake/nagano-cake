class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def create
    customer = current_customer
    cart_item = CartItem.new(cart_item_params)
    if cart_item.customer_id = customer.id
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
      params.require(:cart_item).permit(:item_id, :customer_id, :quantity)
    end

end
