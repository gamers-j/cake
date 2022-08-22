class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
  end

  def show
  end
  
  def create
    cart_products = current_customer.cart_products.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      cart_products.each do |cart|
        order_product = OrderProduct.new
        order_product.product_id = cart.product_id
        order_product.order_id = @order.id
        order_product.order_quantity = cart.quantity
        order_product.order_price = cart.product.price
        order_product.save
      end  
     redirect_to orders_complete_path
     cart_products.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def complete
  end
  
  def confirm
    @order = Order.new(order_params)
    if params[:order][:address_number] == "1"
      @order.name = current_customer.name
      @order.address = current_customer.customer_address
    elsif params[:order][:address_number] == "2"
      if Address.exists?(name: params[:order][:registered])
        @order.name = Address.find(params[:order][:registered]).name
        @order.address = Address.find(params[:order][:registered]).address
      else
        render :new
      end  
    elsif params[:order][:address_number] == "3"
      address_new = current_customer.addresses.new(address_params)
      if address_new.save
      else
        render :new
      end
    else
      redirect_to new_order_path
    end  
    @cart_products = current_customer.cart_products.all
    @total = 0
  end
  
  private 
  
  def order_params
    params.require(:order).permit(:name, :address, :total_price)
  end

  def address_params
    params.require(:order).permit(:name, :address)
  end
end
