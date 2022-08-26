class Public::CartProductsController < ApplicationController
  before_action :ensure_correct_customer, only: [:create, :index, :edit]

  def index
    @cart = CartProduct.where(customer_id: current_customer.id)
    @total = 0
  end

  def create
    @cart_product = CartProduct.new(cart_params)
    #カート内商品 = ログイン会員がカートに入れた商品（find_byでカート内の商品idを探して）
    cart_products = current_customer.cart_products.find_by(product_id: params[:cart_product][:product_id])
    #もしカート内商品が空ならそのまま保存
    if cart_products == nil
      @cart_product.customer_id = current_customer.id
      @cart_product.save
    else
    #空以外はカート内商品個数に足す
      cart_products.quantity += @cart_product.quantity
      cart_products.save
    end
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
    redirect_to cart_products_path
  end

  private

  def cart_params
    params.require(:cart_product).permit(:product_id, :quantity)
  end


  def ensure_correct_customer
    @cart_product = current_customer
    redirect_to products_path unless @cart_product = current_customer
  end
end
