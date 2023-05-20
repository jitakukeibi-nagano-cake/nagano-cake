class Admin::OrderController < ApplicationController
    
    
    def index
        @orders = Order.page(params[:page])
    end
    
    def show
        @order = Order.find(params[:id])
    end
end
