class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
    	t.integer :item_id
    	t.integer :quantity
    	t.float   :unit_price
    	t.float   :full_unit_price
    end
  end
end
