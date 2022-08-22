class ProductOrder < ApplicationRecord

  belongs_to :product
  belongs_to :order


  enum making_status: { cannot_production: 0, waiting_for_production: 1, production: 2, production_completed: 3 }
end
