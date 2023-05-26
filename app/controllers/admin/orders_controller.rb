class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!


  def index
    @order = Order.all.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.where(order_id: @order.id)
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    if @order.update(order_params)
      @order_details.update_all(making_status: 1) if @order.status == "paid_up"
      ## ①注文ステータスが「入金確認」とき、製作ステータスを全て「製作待ち」に更新する
    end
    redirect_to admin_order_path(@order)
  end



  private

  def order_params
    params.require(:order).permit(:status)
  end

end
