class Product < ApplicationRecord
	has_many :cart_products, dependent: :destroy
	has_many :order_products, dependent: :destroy

	belongs_to :genre

	attachment :image

	enum is_valid: {"販売中": true, "売り切れ": false}
end
