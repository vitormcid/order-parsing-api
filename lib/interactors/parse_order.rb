module Interactors
  class ParseOrder
    include Interactor
    
    def call
 			initialize_entities 			
    end

    private

    def initialize_entities   
    	entity_list.each do |method|
    		send(method)
    	end
    end
 

    def initialize_billing_info
    	if billing_info = BillingInfo.create(params[:buyer][:billing_info])
    		context.billing_info = billing_info
    	end
    end

    def initialize_phone
    	if phone = Phone.create(params[:buyer][:phone])
    		context.phone = phone
    	end
    end

    def initialize_city
    	if city = City.create(params[:shipping][:receiver_address][:city])
    		context.city = city
    	end
    end

    def initialize_state
    	if state = State.create(params[:shipping][:receiver_address][:state])
    		context.state = state
    	end
    end

    def initialize_country
      map_to_external_id(params[:shipping][:receiver_address][:country])

    	if country = Country.create(params[:shipping][:receiver_address][:country])
    		context.country = country
    	end
    end

    def initialize_neighborhood
      map_to_external_id(params[:shipping][:receiver_address][:neighborhood])

    	if neighborhood = Country.create(params[:shipping][:receiver_address][:neighborhood])
    		context.neighborhood = neighborhood
    	end
    end   

    def initialize_payments
    	payments = []
    	params[:payments].each do |payment|
        map_to_external_id(payment)

	  		if payment = Payment.create(payment)
	    		payments << payment
	    	end
	    end

	    context.payments = payments
    end

    def initialize_order_items
    	order_items = []
    	params[:order_items].each do |order_item|
        map_to_external_id(order_item[:item])

    		item = Item.create(order_item[:item])
    	
    		if order_item = OrderItem.new(order_item.except(:item))
    			order_item.item_id = item.id
    			order_item.save
    			order_items << order_item
    		end  	
	    end

	    context.order_items = order_items
    end

    def initialize_receiver_address
    	if receiver_address = ReceiverAddress.new(params[:shipping][:receiver_address]
    		.except(:state, :city, :country, :neighborhood))

    		receiver_address.city_id          = context.city.id
    		receiver_address.state_id         = context.state.id
    		receiver_address.country_id       = context.country.id    
    		receiver_address.neighborhood_id  = context.neighborhood.id

    		receiver_address.save
    		context.receiver_address = receiver_address
    	end
    end

    def initialize_buyer   
      map_to_external_id(params[:buyer])   

    	if buyer = Buyer.new(params[:buyer].except(:phone, :billing_info))    		
    		 buyer.phone = context.phone    		
    		 buyer.billing_info = context.billinf_info
    		 buyer.save

    		 context.buyer = buyer
    	end
    end

    def initialize_shipping
      map_to_external_id(params[:shipping])

    	if shipping = Shipping.new(params[:shipping].except(:receiver_address))
    		shipping.receiver_address = context.receiver_address

    		shipping.save
    		context.shipping = shipping
    	end
    end

    def initialize_order
      map_to_external_id(params)
      
  		if order = Order.new(params.except(:order_items, :payments, :shipping, :buyer))
  			order.order_items << context.order_items
  			order.payments << context.payments
  			order.shipping = context.shipping
  			order.buyer = context.buyer

  			order.save
  			context.order = order		
    	end
    end

    def params
    	context.params
    end 

    def map_to_external_id(hash)
      hash[:external_id] = hash.delete :id
    end

    def entity_list
    	["initialize_billing_info", "initialize_phone", "initialize_buyer", "initialize_payments",
    	"initialize_order_items", "initialize_city", "initialize_state", "initialize_country",
    	"initialize_neighborhood", "initialize_receiver_address", "initialize_shipping", "initialize_order"]
    end

  end
end

