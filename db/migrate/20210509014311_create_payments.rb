class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.integer :order_id
      t.string  :kind
      t.float   :value
    end
  end
end
