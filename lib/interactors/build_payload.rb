module Interactors
  class BuildPayload
    include Interactor
    
    def call    	
    	context.parsed_hash = parsed_hash
    end


    private
    
    def parsed_hash    	
    	{
		    "externalCode": context.order.external_id,
		    "storeId": context.order.store_id,
		    "subTotal": context.order.total_amount,
		    "deliveryFee": context.order.total_shipping,
		    "total_shipping": context.order.total_shipping,
		    "total": context.order.total_amount_with_shipping,
		    "country": context.country.external_id,
		    "state": context.state.name,
		    "city": context.city.name,
		    "district": context.neighborhood.name,
		    "street": context.receiver_address.street_name,
		    "complement": context.receiver_address.comment,
		    "latitude": context.receiver_address.latitude,
		    "longitude":  context.receiver_address.longitude,
		    "dtOrderCreate": context.order.date_created,
		    "postalCode": context.receiver_address.zip_code,
		    "number": context.receiver_address.street_number,
		    "customer": {
	        "externalCode": context.buyer.external_id,
	        "name": "#{context.buyer.first_name} #{context.buyer.last_name}",
	        "email": context.buyer.email,
	        "contact": "#{context.phone.area_code} #{context.phone.number}"
		    },

		    "items": items_list,
		    "payments": payments_list
			}
    end

    def items_list
    	items_list = []
    	context.order_items.each do |order_item|    	
    		item_hash = 
    			{
    				"externalCode": order_item.item.id,
    				"name": order_item.item.title,
    				"price": order_item.unit_price,
    				"quantity": order_item.quantity,
    				"total": order_item.full_unit_price,
    				"subitems": []
    			}
    		items_list << item_hash 
    	end

    	items_list
    end

    def payments_list
    	payments_list = []
    	context.payments.each do |payment|    	
    		payment_hash = 
    			{
    				"type": payment.payment_type,
    				"value": payment.total_paid_amount    				
    			}
    		payments_list << payment_hash 
    	end

    	payments_list
    end   
  end
end

