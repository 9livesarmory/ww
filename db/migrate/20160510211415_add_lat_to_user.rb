class AddLatToUser < ActiveRecord::Migration
  def change
    add_column :users, :lat, :decimal
  end
end
