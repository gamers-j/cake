class Public::ProductsController < ApplicationController
  def index
    @active_products = Product.where(is_active: true)
    @products = @active_products.page(params[:page]).per(8)
  end

  def show
  end
  
  def search
  end
end
