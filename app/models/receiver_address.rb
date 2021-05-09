class ReceiverAddress < ApplicationRecord
	has_many   :shippings
	belongs_to :city
	belongs_to :state
	belongs_to :country
	belongs_to :neighborhood
end
