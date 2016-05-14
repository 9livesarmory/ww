class OrdersController < ApplicationController
#merch order controller
before_action :authenticate_user!

	def index
		#@current_merchant_orders=current_user.merchant_orders.where() ???
		@merchant_id=params[:merchant_id]
		@orders=Order.where("merchant_id = ?", @merchant_id)

		render 'index'
	end

	def show
		
	end

	def new
		@newOrder = Order.new
		render 'new'
	end

	def create
		#@top = 
		#@bottom = 
		#@address = 
		#@newOrder=Order.create(params[:merchant_id])
	end

end

