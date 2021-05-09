class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
    	t.string   :external_id
    	t.string   :shipment_type
    	t.datetime :date_created
    	t.integer  :receiver_address_id
    end
  end
end
