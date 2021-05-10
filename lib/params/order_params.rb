module Params
  class OrderParams
  	class << self
	  	def call(params)
	  		params.permit(
	  		  :id,:store_id, :date_created, :date_closed, :last_update, 
          :total_amount, :total_shipping, :total_amount_with_shipping,
          :paid_amount,  :expiration_date, :total_shipping, :status,
          order_items: [ :quantity, :unit_price, :full_unit_price , 
          item: [:id, :title] ], payments: [ :id, :order_id, :payer_id,
          :installments, :payment_type, :status, :transaction_amount,
          :taxes_amount, :shipping_cost, :total_paid_amount,
          :installment_amount, :date_approved, :date_created ],
          shipping: [ :id, :shipment_type, :date_created,
          receiver_address: [ :id, :address_line, :latitude, :longitude,
          :receiver_phone, :street_name, :street_number, :comment, :zip_code,
          city: [:name] , state: :name ,country: [:id , :name],
          neighborhood: [:id, :name] ] ], buyer: [:id, :nickname,
          :email, :first_name, :last_name, phone: [:area_code, :number],
          billing_info: [:doc_type, :doc_number]] )
	  	end
		end
  end
end
