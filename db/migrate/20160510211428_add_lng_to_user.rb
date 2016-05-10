class AddLngToUser < ActiveRecord::Migration
  def change
    add_column :users, :lng, :decimal
  end
end
