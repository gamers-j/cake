class Public::CartProductsController < ApplicationController
  def index
    @cart = CartProduct.where(customer_id: current_customer.id)
    @total = 0
  end

  def create
    @cart_product = CartProduct.new(cart_params)
    @cart_product.customer_id = current_customer.id
    @cart_product.save
    redirect_to cart_products_path
  end

  def update
    cart_product = CartProduct.find(params[:id])
    cart_product.update(quantity: cart_params[:quantity].to_i)
    redirect_to cart_products_path
  end

  def destroy
    cart_product = CartProduct.find(params[:id])
    cart_product.destroy
    redirect_to cart_products_path
  end

  def destroy_all
    cart_product = CartProduct.where(customer_id: current_customer.id)
    cart_product.destroy_all
    redirect_to products_path
  end

  private

  def cart_params
    params.require(:cart_product).permit(:product_id, :quantity)
  end

end
