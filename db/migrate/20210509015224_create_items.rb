class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
    	t.string :externalCode
    	t.string :name
    	t.float  :price
    end
  end
end
