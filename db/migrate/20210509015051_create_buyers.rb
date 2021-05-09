class CreateBuyers < ActiveRecord::Migration[5.2]
  def change
    create_table :buyers do |t|
        t.string  :external_id
    	t.string  :nickname
    	t.string  :email
    	t.integer :phone_id
    	t.string  :first_name
    	t.string  :last_name
    	t.integer :billing_info_id
    end
  end
end
