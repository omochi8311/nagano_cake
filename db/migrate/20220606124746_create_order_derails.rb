class CreateOrderDerails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_derails do |t|

      t.integer :price,null: false
      t.integer :amout,null: false
      t.integer :making_status,null: false
      t.integer :order_id,null: false
      t.integer :item_id,null: false

      t.timestamps
    end
  end
end
