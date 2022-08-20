class Product < ApplicationRecord

  has_one_attached :image

  belongs_to :type
  has_many :product_orders, dependent: :destroy
  has_many :cart_produts, dependent: :destroy

end
