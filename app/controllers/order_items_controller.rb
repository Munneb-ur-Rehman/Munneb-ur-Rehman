class OrderItemsController < ApplicationController
    def create
        @order =current_order
        @orders_items = @order.order_items.new(order_items_params)
        @order.save
        session[:order.id]=@order.id
    end
    private
    def order_items_params
        params.require(:order_items).permit(:product_id, :quantity)
    end
    end
