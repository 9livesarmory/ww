class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :item_id
      t.integer :quantity
      t.integer :total_price
      t.integer :order_id

      t.timestamps null: false
    end
  end
end
