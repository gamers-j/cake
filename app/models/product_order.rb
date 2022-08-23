class ProductOrder < ApplicationRecord

  belongs_to :product
  belongs_to :order

def  add_tax_taxed_price
  (self.taxed_price * 1.10).round
end

  enum making_status: { cannot_production: 0, waiting_for_production: 1, production: 2, production_completed: 3 }
end
