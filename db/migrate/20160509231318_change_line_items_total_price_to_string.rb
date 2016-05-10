class ChangeLineItemsTotalPriceToString < ActiveRecord::Migration
  def change
  	change_column :line_items, :total_price, :string
  end
end
