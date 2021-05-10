class CreateOrders < ActiveRecord::Migration[5.2]
  def change
  	create_table :orders do |t|
      t.integer   :address_id
      t.integer   :customer_id  
      t.string    :externalCode  
      t.integer   :storeId        
      t.string    :subTotal       
      t.string    :deliveryFee  
      t.float     :total_shipping
      t.string    :total   
      t.string    :dtOrderCreate
    end
  end
end
