class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer  :user_id
      t.integer  :item_id
      t.string   :action            # Added_item, removed_item, updated_item
      t.integer  :ammount_changed   # Keeps track of units of ammount changed

      t.timestamps
    end
  end
end
