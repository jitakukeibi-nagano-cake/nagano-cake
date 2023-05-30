class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

def update
  @order_detail = OrderDetail.find(params[:id])
  @order = @order_detail.order
  @order_detail.update(order_detail_params)
   #もし製作ステータスが製作中であればorderステータスを2に更新する
  if @order_detail.making_status == "in_production"
    @order.update(status: 2)
   #商品の個数と製作ステータスの「製作完了」の商品カウント数が一致すればorderのステータスを3で更新する
 elsif @order.order_details.count == @order.order_details.where(making_status: "production_complete").count
   @order.update(status: 3)
  end
  redirect_to admin_order_path(@order)
end

private

def order_detail_params
  params.require(:order_detail).permit(:making_status)
end

end
