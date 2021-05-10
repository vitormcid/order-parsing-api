module Schemas
  class OrderSchema
    class << self
      def call
        {
          "id": Integer,
          "store_id": Integer,
          "date_created": String,
          "date_closed": String,
          "last_updated": String,
          "total_amount": Float,        
          "total_amount_with_shipping": Float,
          "paid_amount": Float,
          "expiration_date": String,
          "total_shipping": Float,       
          "shipping": {
            "id": Integer,
            "shipment_type": String,
            "date_created": String,
            "receiver_address": {
              "id": Integer,
              "address_line": String,
              "street_name": String,
              "street_number": String,
              "comment":  String,
              "zip_code": String,
              "city": {
                "name": String
              },
              "state": {
                "name": String
              },
              "country": {
                "id": String,
                "name": String
              },
              "neighborhood": {             
                "name": String
              },
              "latitude": Float,
              "longitude": Float,
              "receiver_phone": String
            }
          },
          "status": String,
          "buyer": {
            "id": Integer,
            "nickname": String,
            "email": String,
            "phone": {
              "area_code": Integer,
              "number": String
            },
            "first_name": String,
            "last_name": String,
            "billing_info": {
              "doc_type": String,
              "doc_number": String
            }
          }
        }
      end
    end
  end
end
