module Validations
  class Order
    class << self
      def run(params, action = :parse)        
        self.send(action, params)
      end

      private

      def validate_order_id(param)
        "O id deve ser um inteiro" unless param.class == Integer
      end

      def validate_store_id(param)
        "O id da loja deve ser um inteiro" unless param.class == Integer
      end

      def validate_date_created(param)      
        "A data de criação deve estar em forma de string" unless param.class == String
      end

      def validate_date_closed(param)      
        "A data de fechamento deve estar em forma de string" unless param.class == String
      end

      def validate_last_updated(param)             
        "A data de ultima atualização deve estar em forma de string" unless param.class == String
      end

      def validate_total_amount(param)
        "O id deve ser um inteiro" unless param.class == Float
      end

      def validate_total_shipping(param)
        "O valor total de cobrança deve ser um número não inteiro" unless param.class == Float
      end

      def validate_total_amount_with_shipping(param)  
        "O valor total com cobrança deve ser um número não inteiro" unless param.class == Float
      end

      def validate_paid_amount(param)  
        "O pago deve ser um número não inteiro" unless param.class == Float
      end

      def validate_expiration_date(param)             
        "A data de expiração deve estar em forma de string" unless param.class == String
      end

      def validate_shipping_id(param)             
        "O Id da cobrança deve ser um inteiro" unless param.class == Integer
      end





      def build(params) 
        [
          
        ].compact
      end

      def parse(params) 
        [
          validate_order_id(params[:id]),
          validate_store_id(params[:store_id]),
          validate_date_created(params[:date_created]),
          validate_date_closed(params[:date_closed]),      
          validate_total_amount(params[:total_amount]),
          validate_total_shipping(params[:total_shipping]),
          validate_total_amount_with_shipping(params[:total_amount_with_shipping]),
          validate_paid_amount(params[:paid_amount]),
          validate_expiration_date(params[:expiration_date]),
          validate_shipping_id(params[:shipping][:id])         

        ].compact
      end

    end
  end
end
