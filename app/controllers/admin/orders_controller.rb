class Admin::OrdersController < ApplicationController


    def index
        @orders = Order.all.page(params[:page])
    end

    def show
        @orders = Order.find(params[:id])
    end
end
