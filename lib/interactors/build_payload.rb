module Interactors
  class BuildPayload
    include Interactor
    
    def call 
      return unless context.order.present?
      
      context.parsed_hash = build_payload
    end

    private
    
    def build_payload 
      parsed_payload = {}

      parsed_hashs.each do |parsed_hash|
        hash_context = "context.#{parsed_hash}"
        parsed_payload.merge!(eval(hash_context))
      end   

      context.parsed_payload = parsed_payload     
    end

    def parsed_hashs
      [ "address", "customer", "order", "items", "payments" ]
    end

  end
end

