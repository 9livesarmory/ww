class OrdersController < ApplicationController
#merch order controller
# before_action :authenticate_user!

	def index
		#@current_merchant_orders=current_user.merchant_orders.where() ???
		@orders=Order.all

		render 'index'
	end

	def show
		
	end

end

