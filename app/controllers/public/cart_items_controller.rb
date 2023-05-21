class Public::CartItemsController < ApplicationController

  def index
    @cart_item = Cart_item.all
    @total = 0
  end

  def create
    cart_item = Cart_item.new(cart_item_params)
    cart_item.save
    redirect_to cart_items_path
  end
  
  def update
    cart_item = CartItem.find(params[:di])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end 
  

  def destroy
    cart_item = Cart_item.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end 
  
  def destory_all
    CartItem.destroy_all
    redirect_to cart_items_path
  end
  
  private
    def cart_item_params
      prams.require(:cart_item).permit(:item_id, :quantity)
    end

end
