class Buyer < ApplicationRecord
	has_many :orders
	belongs_to :phone
	belongs_to :billing_info
end
