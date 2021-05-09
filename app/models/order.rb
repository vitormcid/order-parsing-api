class Order < ApplicationRecord
	has_many :order_items
	has_many :payments
	belongs_to  :shipping
	belongs_to :buyer
end
