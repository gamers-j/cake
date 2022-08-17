class CreateProductOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :product_orders do |t|
      
      t.integer :order_id, null: false
      t.integer :product_id, null: false
      t.integer :taxed_price, null: false
      t.integer :quantity, null: false
      t.integer :making_status, null: false

      t.timestamps
    end
  end
end
