class SearchesController < ApplicationController

	# before_action :authenticate_user!
	
	def index
		@merchants=User.within(1, :origin => [25.7745031,-80.1917512]).where(role: "merchant")
	end
end