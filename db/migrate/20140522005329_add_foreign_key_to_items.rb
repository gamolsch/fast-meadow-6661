class AddForeignKeyToItems < ActiveRecord::Migration
  def change
    add_column :items, :storage_id, :integer
    add_index :items, :storage_id
  end
end
