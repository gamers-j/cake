class Public::HomesController < ApplicationController
  def top
    #新着順
    @products = Product.order('id DESC').limit(4)
    @types = Type.all
  end

  def about
  end
  
end
