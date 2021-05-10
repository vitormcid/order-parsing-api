class Customer < ApplicationRecord
  validates :externalCode, :name, :email,
            :contact, presence: true

  has_many :orders
end
