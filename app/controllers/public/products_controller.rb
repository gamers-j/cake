class Public::ProductsController < ApplicationController
  def index
    @active_products = Product.where(is_active: false)
    @products = @active_products.page(params[:page]).per(8)
    @types = Type.all
  end

  def show
    @product=Product.find(params[:id])
    @types = Type.all
  end
  
  def search
    @type = Type.find_by(name: params[:keyword])
    products = @type.products
    @active_products = products.where(is_active: true)
    @products = @active_products.page
    render :index
  end
end
