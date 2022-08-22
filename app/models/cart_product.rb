class CartProduct < ApplicationRecord
  belongs_to :product
  belongs_to :customer

  def add_tax_taxed_price
  (self.product.nontaxed_price * 1.10).round
  end

  def subtotal
    add_tax_taxed_price * quantity
  end
end
