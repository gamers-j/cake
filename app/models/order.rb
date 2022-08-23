class Order < ApplicationRecord

  belongs_to :customer
  has_many :product_orders, dependent: :destroy

  #商品の合計金額メソッド
  def subtotal
    total = 0
    product_orders.each do |product_order|
    total = product_order.add_tax_taxed_price * product_order.quantity
    end
    total
  end

  def total_amount
    #product_orders.taxed_price * product_orders.quantity + 800
    total = 0
    product_orders.each do |product_order|
    total = product_order.add_tax_taxed_price * product_order.quantity
    end
    total + 800
  end

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting_for_payment: 0, payment_confirmation: 1, production: 2, shipping_preparation: 3, sent: 4 }

end
