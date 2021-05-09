class CreateReceiverAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :receiver_addresses do |t|
      t.string   :external_id
    	t.string   :address_line
      t.string   :street_name
      t.string 	 :street_number
      t.string   :comment
      t.string   :zip_code
      t.integer  :city_id
      t.integer  :state_id
      t.integer  :country_id
      t.integer  :neighborhood_id
      t.integer  :latitude
      t.integer  :longitude
      t.string   :receiver_phone
    end
  end
end
