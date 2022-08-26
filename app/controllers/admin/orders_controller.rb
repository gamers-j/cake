class Admin::OrdersController < ApplicationController
   before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    @product_orders = @order.product_orders
  end

  def update
    @order = Order.find(params[:id])
    @order.update(status: params[:order][:status])

    if @order.status == "payment_confirmation"
      @order.product_orders.each do |product_order|
        if product_order.making_status == "cannot_production"
          product_order.update(making_status: 1)
        end
      end
    end
    redirect_to admin_order_path(@order.id)
  end

  def order_params
    params.require(:order).permit(:status)
  end

end
