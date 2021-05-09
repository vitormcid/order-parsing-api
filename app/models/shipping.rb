class Shipping < ApplicationRecord
	has_one :order
	belongs_to :receiver_address
end
