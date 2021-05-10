class Order < ApplicationRecord
  validates :externalCode, :storeId, :subTotal,
            :deliveryFee, :total_shipping, :total, :dtOrderCreate,
            presence: true

  belongs_to :address
  belongs_to :customer
end
