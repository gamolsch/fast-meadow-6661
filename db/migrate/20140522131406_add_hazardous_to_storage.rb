class AddHazardousToStorage < ActiveRecord::Migration
  def change
    add_column :storages, :hazardous, :boolean
  end
end
