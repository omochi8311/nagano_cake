class CreateCratItems < ActiveRecord::Migration[6.1]
  def change
    create_table :crat_items do |t|
      t.integer :amount,null: false

      t.timestamps
    end
  end
end
