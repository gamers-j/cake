class Admin::OrdersController < ApplicationController
   before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    
  end
  
  def update
     @order = Order.find(params[:id])
     @orader.update(order.params)
     redirect_to root_path
  end
  
end
