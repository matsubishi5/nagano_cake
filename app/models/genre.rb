class Genre < ApplicationRecord
	has_many :products, dependent: :destroy

	enum is_valid: { "有効": true, "無効": false }
end
