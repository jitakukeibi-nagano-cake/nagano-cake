class Public::OrdersController < ApplicationController
  include Public::HomesHelper
  
  before_action :to_confirm, only: [:show]
  before_action :authenticate_customer!
  
  

  def new
    @order = Order.new
    @delivery_address = current_customer.address
    @delivery_address = DeliveryAddress.where(customer: current_customer)
  end

  def confirm
     @cart_items = current_customer.cart_items
     @total_quantity = @cart_items.inject(0) {|sum, item| sum + item.subtotal }
     @postage = 800
     @total_payment = @postage + @total_quantity
     
     @order = Order.new
    
    
    
     if params[:order][:addresses] == "residence"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
     elsif params[:order][:addresses] == "registration"
      delivery = DeliveryAddress.find(params[:order][:delivery_address_id]) 
      @order.postcode = delivery.postcode
      @order.address = delivery.address
      @order.name = delivery.name
     elsif params[:order][:addresses] == "new_address"
      @order.postcode = params[:order][:postcode]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
      @delivery = "1"
     end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
   
    if @order.save
      @cart_items = CartItem.where(customer_id: current_customer.id)
      @cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.item_id = cart_item.item_id
        order_detail.order_id = @order.id
        order_detail.quanity = cart_item.quanity
        order_detail.price_including_tax = change_price_excluding_tax(cart_item.item.price_excluding_tax)
        order_detail.production_status = 0
        if order_detail.save
          @cart_items.destroy_all
        end
      end
      redirect_to orders_thanks_path
    else
    end
  end

  def thanks
  end

  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = Order.where(customer_id: current_customer.id).order(created_at: :desc)
  end

  private

  def order_params
    params.require(:order).permit(:postcode, :address, :name, :total_payment, :payment_method)
  end
  
  def to_confirm
    redirect_to customer_items_path if params[:id] == "confirm"
  end

end