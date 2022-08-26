class Admin::ProductOrdersController < ApplicationController

  def update
     product_order = ProductOrder.find(params[:id])
     @order =  product_order.order
     if @order.update(order_params)
      if @order.status == "入金待ち"
        product_orders.update_all(making_status: "着手不可")
      elsif @order.status == "入金確認"
        product_orders.update_all(making_status: "製作待ち")
      end
      redirect_to admin_order_path(@order)
    else
      render admin_order_path
    end
  end

  def product_order_params
    params.require(:product_order).permit(:making_status)
  end

end
