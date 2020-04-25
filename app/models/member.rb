class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

	has_many :cart_products, dependent: :destroy
	has_many :orders, dependent: :destroy
	has_many :deliveries, dependent: :destroy

	enum is_valid: { "有効": true, "退会済": false }

	def full_name
    self.first_name + self.last_name
	end
	
	def full_reading_name
    self.reading_first_name + self.reading_last_name
  end
end
