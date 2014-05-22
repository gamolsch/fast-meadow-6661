class AddCategoryIdToItem < ActiveRecord::Migration
  def change
    remove_column   :items, :storage_id
    add_column      :items, :category_id, :integer
  end
end
