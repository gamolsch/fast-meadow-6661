class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :storage_id
      t.string :manufacturer
      t.string :name
      t.string :lot_number
      t.date :manufactured_on
      t.date :expired_on

      t.timestamps
    end
  end
end
