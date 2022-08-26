class Admin::ProductOrdersController < ApplicationController

  def update
    @product_order = ProductOrder.find(params[:id])
    @product_order.update(making_status: params[:product_order][:making_status])

    if @product_order.making_status == "production"
      @product_order.order.update(status: 2)
    elsif ProductOrder.where(order_id: @product_order.order_id).count == ProductOrder.where(order_id: @product_order.order_id, making_status: "production_completed").count
      #OrderItem.where(making_status: 3).count
      @product_order.order.update(status: 3)
      #Order.find(id: @order_item.order_id).update(order_status: 3)
      end

      redirect_to admin_order_path(@product_order.order)
    end

  def product_order_params
    params.require(:product_order).permit(:making_status)
  end

end
