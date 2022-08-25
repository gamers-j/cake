class Admin::ProductOrdersController < ApplicationController
  
  def update
     product_order = ProductOrder.find(params[:id])
     product_order.update(product_order_params)
     redirect_to admin_root_path
  end
  
  def product_order_params
    params.require(:product_order).permit(:making_status)
  end
  
end
