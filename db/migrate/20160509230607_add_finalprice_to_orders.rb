class AddFinalpriceToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :finalprice, :string
  end
end
