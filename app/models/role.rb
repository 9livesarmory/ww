class Role < ActiveRecord::Base
	has_many_and_belongs_to :user
end
