class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|   
      t.integer  :order_id
      t.integer  :payer_id
      t.integer  :installments
      t.string   :payment_type
      t.string   :paid
      t.float    :transaction_amount
      t.integer  :taxes_amount
      t.float    :shipping_cost
      t.float    :total_paid_amount
      t.float    :installment_amount
      t.datetime :date_approved
      t.datetime :date_created
    end
  end
end
