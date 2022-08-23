class Order < ApplicationRecord

  belongs_to :customer
  has_many :product_orders, dependent: :destroy

  

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting_for_payment: 0, payment_confirmation: 1, production: 2, shipping_preparation: 3, sent: 4 }

end
