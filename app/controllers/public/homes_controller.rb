class Public::HomesController < ApplicationController
  def top
    #新着順
    @active_products = Product.where(is_active: false)
    @products = @active_products.order('id DESC').limit(4)
    @types = Type.all
  end

  def about
  end

end
