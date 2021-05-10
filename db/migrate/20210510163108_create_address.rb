class CreateAddress < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :country
      t.string :state
      t.string :city
      t.string :district
      t.string :street
      t.string :complement
      t.float  :latitude
      t.float  :longitude
      t.string :postalCode
      t.string :number
    end
  end
end
