class Payment < ApplicationRecord
  validates :kind, :value, presence: true

  belongs_to :order
end
