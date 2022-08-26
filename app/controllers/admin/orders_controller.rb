class Admin::OrdersController < ApplicationController
   before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])

  end

  def update
    @order = Order.find(params[:id])
    product_orders = @order.product_orders
    if @order.update(order_params)
      if @order.status == "入金待ち"
        product_orders.update_all(making_status: "着手不可")
      elsif @order.status == "入金確認"
        product_orders.update_all(making_status: "製作待ち")
      end
      redirect_to admin_order_path(@order)
    else
      render "show"
    end
  end

  def order_params
    params.require(:order).permit(:status)
  end

end
