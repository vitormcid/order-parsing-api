class CreateOrders < ActiveRecord::Migration[5.2]
  def change
  	create_table :orders do |t|
      t.string   :external_id
      t.integer  :store_id
      t.datetime :date_created
      t.datetime :date_closed
      t.datetime :last_updated
      t.float 	 :total_amount
      t.float	   :total_shipping
      t.float 	 :total_amount_with_shipping
      t.float    :paid_amount
      t.datetime :expiration_date
      t.integer  :shipping_id
      t.string	 :status
      t.integer  :buyer_id
    end
  end
end
