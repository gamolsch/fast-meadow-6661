class AddColumnCodeToItems < ActiveRecord::Migration
  def change
  	add_column :items, :code, :string
  end
end
