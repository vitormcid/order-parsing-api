module Validations
  class Order
    class << self
      def run(params)        
        validate_all(params)
      end

      private     

      def hash_params(params)
        params.permit!.to_h
      end

      def validate_order_schema(params)
        result = HashValidator.validate(hash_params(params), Schemas::OrderSchema.call)

        result.errors
      end

      def validate_payments_schema(params)
        errors = {}
        params.each do |params_payment|
          result = HashValidator.validate(hash_params(params_payment), Schemas::PaymentSchema.call).errors
          errors.merge!(result)
        end

        errors
      end

      def validate_items_schema(params)
        errors = {}
        params.each do |params_item|          
          result = HashValidator.validate(hash_params(params_item), Schemas::ItemSchema.call).errors
          errors.merge!(result)
        end

        errors
      end

      def validate_all(params)
        [
          *validate_order_schema(params),
          *validate_payments_schema(params[:payments]),
          *validate_items_schema(params[:order_items])
        ].to_h
      end
    end
  end
end
