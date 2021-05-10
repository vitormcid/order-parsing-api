module Interactors
  class SendOrder
    include Interactor
    
    def call
    	context.response = send_order
    end

    private

    def send_order
    	response =
    		HTTParty.post(
    			"https://delivery-center-recruitment-ap.herokuapp.com/",
          :body => context.parsed_hash.to_json,
          :headers => {'X-Sent': formated_current_date }
			)
        
      response
    end

    def formated_current_date
      DateTime.now.strftime("%Hh%M-%d/%m/%y")
    end
  end
end

