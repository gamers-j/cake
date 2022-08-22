class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
    @products = Product.page(params[:page])
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_product_path(@product.id)
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to admin_product_path(@product.id)
  end

  private

  def product_params
    params.require(:product).permit(:type_id,:name,:introduction,:nontaxed_price,:is_active)
  end
end