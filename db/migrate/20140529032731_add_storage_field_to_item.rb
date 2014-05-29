class AddStorageFieldToItem < ActiveRecord::Migration
  def change
    add_column :items, :storage, :string
  end
end
