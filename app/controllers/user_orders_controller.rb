class UserOrdersController < ApplicationController

	before_action :authenticate_user!
#user order controller
	def index
		@newOrder=Order.new
	end

	def create
		# @newOrder=Order.new(:title => params[:product][:title], :description => params[:product][:description])
		# @newOrder.save

		# redirect_to search_path
	end
end