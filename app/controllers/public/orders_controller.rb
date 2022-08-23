class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
  end

  def create
    @cart_products = CartProduct.where(customer_id: current_customer.id)
    @order = current_customer.orders.new(order_params)
    if @order.save
      @cart_products.each do |cart|
        #product_orderにcart_productsのデータを保存
        product_order = ProductOrder.new
        product_order.product_id = cart.product_id
        product_order.order_id = @order.id
        product_order.quantity = cart.quantity
        product_order.taxed_price = cart.product.nontaxed_price
        product_order.save
      end
     redirect_to orders_complete_path
     @cart_products.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def complete
  end

  def confirm
    #public_orderの確認アクション
    @order = Order.new(order_params)
    if params[:order][:address_number] == "1"
      @order.name = current_customer.first_name + current_customer.last_name
      @order.address = current_customer.address
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
    @cart_products = CartProduct.where(customer_id: current_customer.id)
    @total = 0
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :total_amount, :payment_method, :postal_code, :customer_id, :postage, :created_at)
  end

  def address_params
    params.require(:order).permit(:name, :address)
  end
end
