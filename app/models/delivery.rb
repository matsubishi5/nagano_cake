class Delivery < ApplicationRecord
	belongs_to :member

  def full_delivery
    self.post_code + self.address + self.name
  end
end
