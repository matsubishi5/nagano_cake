class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
			t.integer "order_id"
			t.integer "product_id"
			t.string "name", null: false
			t.string "price", null: false
			t.integer "quantity", null: false
			t.integer "production_status", default: 0, null: false
      t.timestamps
    end
  end
end
