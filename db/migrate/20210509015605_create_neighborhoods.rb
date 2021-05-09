class CreateNeighborhoods < ActiveRecord::Migration[5.2]
  def change
    create_table :neighborhoods do |t|
    	t.string :external_id
    	t.string :name
    end
  end
end
