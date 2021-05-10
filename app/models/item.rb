class Item < ApplicationRecord
  validates :externalCode, :name, :price, presence: true

  has_one :order_item
end
