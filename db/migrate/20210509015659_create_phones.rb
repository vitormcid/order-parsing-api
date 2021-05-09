class CreatePhones < ActiveRecord::Migration[5.2]
  def change
    create_table :phones do |t|
    	t.integer :area_code
    	t.string  :number
    end
  end
end
