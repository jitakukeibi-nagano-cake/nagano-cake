class Public::OrdersController < ApplicationController
  include Public::HomesHelper

  before_action :authenticate_customer!


  def new
    @order = Order.new
    @delivery_addresses = current_customer.delivery_addresses
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
    @postage= 800
    if @order.save
      @cart_items = CartItem.where(customer_id: current_customer.id)
      @cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.item_id = cart_item.item_id
        order_detail.order_id = @order.id
        order_detail.quantity = cart_item.quantity
        order_detail.price = (cart_item.item.price * 1.1).floor
        order_detail.making_status = 0
        order_detail.save
      end
      redirect_to orders_thanks_path
      @cart_items.destroy_all
    else
      @customer = current_customer
      render :new
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
    params.require(:order).permit(:postcode, :address, :name, :total_payment, :payment_method, :postage)
  end

end