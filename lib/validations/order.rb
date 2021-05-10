module Validations
  class Order
    class << self
      def run(params)        
        validate_order_schema(params)
      end

      private

      def hash_params(params)
        params.permit!.to_h
      end

      def validate_order_schema(params) 
        HashValidator.validate(hash_params(params), Schemas::OrderSchema.call).errors 
      end
    end
  end
end
