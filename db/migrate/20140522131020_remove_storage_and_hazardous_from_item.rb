class RemoveStorageAndHazardousFromItem < ActiveRecord::Migration
  def change
    remove_column :items, :storage
    remove_column :items, :hazardous
  end
end
