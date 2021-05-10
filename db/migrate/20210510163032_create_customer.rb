class CreateCustomer < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :externalCode
      t.string :name
      t.string :email
      t.string :contact
    end
  end
end
