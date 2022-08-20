class Public::HomesController < ApplicationController
  def top
    #新着順
    @products = Product.order('id DESC').limit(4)
  end

  def about
  end
  
end
