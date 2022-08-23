class Order < ApplicationRecord

  belongs_to :customer
  has_many :product_orders, dependent: :destroy

  def total_amount
    #product_orders.taxed_price * product_orders.quantity + 800
    total = 0
    product_orders.eath do |product_order|
    product_order.add_tax_taxed_price
    
    
    end
    total + 800
  end
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting_for_payment: 0, payment_confirmation: 1, production: 2, shipping_preparation: 3, sent: 4 }

end
