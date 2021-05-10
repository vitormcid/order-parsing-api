module Schemas
  class PaymentSchema
    class << self
      def call
      {
        "id": Integer,
        "order_id": Integer,
        "payer_id": Integer,
        "installments": Integer,
        "payment_type": String,
        "status": String,
        "transaction_amount": Float,
        "taxes_amount": Integer,
        "shipping_cost": Float,
        "total_paid_amount": Float,
        "installment_amount": Float,
        "date_approved": String,
        "date_created": String
      }
      end
    end
  end
end
