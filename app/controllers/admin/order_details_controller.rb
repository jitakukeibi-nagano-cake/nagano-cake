class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

def show
  @order = Order.find(params[:id])
  @order_details = @order.order_details.all
end

def update
  @order = Order.find(params[:id])
  @order_details = OrderDetail.where(order_id: params[:id])
end

private

def order_detail_params
  params.require(:order_detail).permit(:making_status)
end

end
