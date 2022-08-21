class Public::CartProductsController < ApplicationController
  def index
    @cart = CartProduct.where(customer_id: current_customer.id)
    @total = 0
  end

  def create
    @cart_product = CartProduct.new(cart_params)
    @cart_product.customer_id = current_customer.id
    @cart_product.save
    redirect_to cart_products_
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end


end
