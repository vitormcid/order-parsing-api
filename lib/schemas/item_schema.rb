module Schemas
  class ItemSchema
    class << self
      def call
      {
        "item": {
          "id": String,
          "title": String
        },
        "quantity": Integer,
        "unit_price": Float,
        "full_unit_price": Float
      }
      end
    end
  end
end
