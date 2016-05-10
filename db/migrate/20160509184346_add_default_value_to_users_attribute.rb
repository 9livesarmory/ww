class AddDefaultValueToUsersAttribute < ActiveRecord::Migration
  def change
  	change_column :users, :role, :string, :default => "client"
  end
end
