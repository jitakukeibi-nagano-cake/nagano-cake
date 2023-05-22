class Public::DeliveryAddressesController < ApplicationController

  def create
    @customer = current_customer
    @address = DeliveryAddress.new(delivery_address_params)
    @address.customer = current_customer
    @addresses = @customer.delivery_addresses.all
    if @address.save
      redirect_to request.referer
      flash[:success] = "配送先を追加しました"
    else
    render :index
    end
  end

  def index
    @customer = current_customer
    @address = DeliveryAddress.new
    @addresses = @customer.delivery_addresses.all
  end

  def edit
    @address = DeliveryAddress.find(params[:id])
    #address = DeliveryAddress.find(params[:id])#DeliveryAddressからパラメータのidに合致するレコードを探してaddressに入れてください。
    #customer = Customer.find(address.customer.id)#Customerからaddressレコードのcustomer
    #unless customer.id == current_customer.id
    #  redirect_to books_path
    #end
    #@book = Book.find(params[:id])
  end

  def update
    address = DeliveryAddress.find(params[:id])
    address.update(delivery_address_params)
    redirect_to delivery_addresses_path
  end

  def destroy
    address = DeliveryAddress.find(params[:id])
    address.destroy
    redirect_to delivery_addresses_path
  end

  private
    def delivery_address_params
      params.require(:delivery_address).permit(:postcode, :address, :name)
    end
end
