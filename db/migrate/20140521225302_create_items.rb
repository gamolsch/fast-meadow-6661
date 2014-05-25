class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :manufacturer
      t.string :name
      t.string :lot_number
      t.date :manufactured_on
      t.date :expired_on
      t.string   :unit_of_measure

      t.timestamps
    end
  end
end
