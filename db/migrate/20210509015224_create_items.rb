class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
    	t.string :external_id
    	t.string :title
    end
  end
end
