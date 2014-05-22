class CreateStorages < ActiveRecord::Migration
  def change
    create_table :storages do |t|
      t.string    :name
      t.boolean   :hazardous

      t.timestamps
    end
  end
end
