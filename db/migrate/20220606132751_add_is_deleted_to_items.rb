class AddIsDeletedToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :is_deleted, :boolean,default: false
  end
end