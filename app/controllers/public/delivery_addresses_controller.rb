class Public::DeliveryAddressesController < ApplicationController

  def create
    @address = DeliveryAddress.new(deliveryaddress_params)
    @address.save
    redirect_to delivery_addresses_path
  end

  def index
    @address = DeliveryAddress.new
  end

  def edit
    @address = DeliveryAddress.find(params[:id])
  end

  def update
    address = DeliveryAddress.find(params[:id])
    address.update(deliveryaddress_params)
    redirect_to delivery_addresses_path
  end

  def destroy
    address = DeliveryAddress.find(params[:id])
    address.destory
    redirect_to delivery_addresses_path
  end

  private
    def deliveryaddress_params
      params.require(:deliveryaddress).permit(:postcode, :address, :name)
    end
end
