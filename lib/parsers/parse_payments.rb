module Parsers
  class ParsePayments
    class << self
      def call(params)
        parsed_payments = []

        params.each do |payment|
          parsed_payments << {
            type: payment[:payment_type],
            value: payment[:total_paid_amount]
          }
        end

        { payments: parsed_payments }
      end
    end
  end
end
