class Admin::OrderController < ApplicationController


    def index
        @order = Order.all.page(params[:page])
    end

    def show
        @order = Order.find(params[:id])
    end
end
