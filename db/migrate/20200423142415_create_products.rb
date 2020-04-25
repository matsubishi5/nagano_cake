class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
			t.integer "genre_id"
			t.string "name", null: false
			t.string "image_id", null: false
			t.text "introduction", null: false
			t.integer "price", null: false
			t.boolean "is_valid", default: true, null: false
			t.datetime "created_at", null: false
			t.datetime "updated_at", null: false
      t.timestamps
    end
  end
end
