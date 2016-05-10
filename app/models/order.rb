class Order < ActiveRecord::Base
	has_many :line_items
	belongs_to :client, class_name:"User"
	belongs_to :merchant, class_name:"User"
end
