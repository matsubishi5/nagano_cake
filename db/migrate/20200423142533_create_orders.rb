class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
			t.integer "member_id"
			t.string "post_code", null: false
			t.string "address", null: false
			t.string "name", null: false
			t.integer "postage", null: false
			t.integer "total_price", null: false
			t.integer "payment_method", null: false
			t.integer "order_status", default: 0, null: false
      t.timestamps
    end
  end
end
