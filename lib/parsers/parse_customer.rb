module Parsers
  class ParseCustomer
    class << self
      def call(params) 
      {
        customer: 
        {         
          externalCode: params[:id],
          name: params[:nickname],
          email: params[:email],
          contact: contact(params)
        }
      }
      end

      private
      
      def contact(params)
        "#{params[:phone][:area_code]} #{params[:phone][:number]}"
      end
    end
  end
end
