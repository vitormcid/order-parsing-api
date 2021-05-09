class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
    	t.string :external_id
    	t.string :initials
    	t.string :name
    end
  end
end
