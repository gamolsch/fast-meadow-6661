class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer        :storage_id
      t.string         :color

      t.timestamps
    end
  end
end
