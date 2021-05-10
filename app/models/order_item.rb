class OrderItem < ApplicationRecord
  validates :order_id, :item_id, :quantity, :total, presence: true

  belongs_to :order
  belongs_to :item
end
