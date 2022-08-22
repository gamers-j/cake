class Product < ApplicationRecord

  has_one_attached :profile_image

  belongs_to :type
  has_many :product_orders, dependent: :destroy
  has_many :cart_produts, dependent: :destroy

def  add_tax_taxed_price
  (self.nontaxed_price * 1.10).round
end

def get_profile_image(width, height)
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
  end
  profile_image.variant(resize_to_limit: [width, height]).processed
end

end
