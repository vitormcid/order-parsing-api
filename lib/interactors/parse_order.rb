module Interactors
  class ParseOrder
    include Interactor

    before do      
      errors = Validations::Order.run(params)
      context.errors =  errors
    end

    def call
      return if context.errors.present?
 	    parse_all 			
    end

    private

    def parse_all
    	parsing_methods.each do |method|
    		send("#{method}")
    	end
    end

    def parse_order
      context.order = Parsers::ParseOrder.call(params)
    end

    def parse_address      
      context.address = Parsers::ParseAddress.call(address_params)
    end

    def parse_items
      context.items = Parsers::ParseItems.call(items_params)
    end

    def parse_customer         
      context.customer = Parsers::ParseCustomer.call(customer_params)
    end

    def parse_payments
      context.payments = Parsers::ParsePayments.call(payments_params)
    end

    def params
      @params ||= context.params
    end   

    def address_params
      params[:shipping][:receiver_address]
    end

    def items_params
      params[:order_items]
    end

    def customer_params
      params[:buyer]
    end

    def payments_params
      params[:payments]
    end

    def parsing_methods
      ['parse_order', 'parse_address', 'parse_items',
       'parse_customer', 'parse_payments' 
      ]
    end
  end
end

