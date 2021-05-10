module Parsers
  class ParseOrder
    class << self
      def call(params)    
        {
          externalCode:   params[:id],
          storeId:        params[:store_id],
          subTotal:       params[:total_amount],
          deliveryFee:    params[:total_shipping],
          total_shipping: params[:total_shipping],
          total:          params[:total_amount_with_shipping],
          dtOrderCreate:  params[:date_created]
        }
      end
    end
  end
end
