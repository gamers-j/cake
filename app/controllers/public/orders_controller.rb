class Public::OrdersController < ApplicationController
  before_action :ensure_correct_customer, only: [:new, :create, :index, :show, :edit, :complete, :confirm]

  def new
    @order = Order.new
    @cart_products = current_customer.cart_products
    #カート内商品が空ならカート一覧画面に戻す（nilは×）
    if @cart_products.blank?
      redirect_to cart_products_path
    end
  end

  def index
    #注文履歴一覧アクション
    @orders = Order.where(customer_id: current_customer.id)
    @orders = Order.page(params[:page])
  end

  def show
    #注文履歴詳細アクション
    @order = Order.find(params[:id])
    @product = ProductOrder.where(order_id: @order.id)
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
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
    elsif params[:order][:address_number] == "2"
      if DeliveryAddress.exists?(id: params[:order][:registered])#idで配送先住所を探して
        @order.name = DeliveryAddress.find(params[:order][:registered]).name
        @order.postal_code = DeliveryAddress.find(params[:order][:registered]).postal_code
        @order.address = DeliveryAddress.find(params[:order][:registered]).address
      else
        render :new
      end
    elsif params[:order][:address_number] == "3"
      address_new = current_customer.delivery_addresses.new(address_params)
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
    params.require(:order).permit(:name, :postal_code, :address)
  end

  def ensure_correct_customer
    @order = current_customer
    redirect_to products_path unless @order = current_customer
  end
end
