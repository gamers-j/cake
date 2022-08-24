class Admin::HomesController < ApplicationController
  def top
   @orders = Order.all
   #=0にしないとnilになってしまうため初期値を０に定義する
   @quantity = 0
  end
end
