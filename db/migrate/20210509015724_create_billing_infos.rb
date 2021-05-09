class CreateBillingInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :billing_infos do |t|
      t.string :doc_type
      t.string :doc_number
    end
  end
end
