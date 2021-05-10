class Address < ApplicationRecord
  validates :country, :state, :city, :district,
            :street, :complement, :latitude, :longitude,
            :postalCode, :number, presence: true

  has_many :orders
end
