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
		@shirt=Item.where(" name = ? ", "shirt")
		@pants=Item.where(" name = ? ", "pants")
		render 'new'
	end

	def create
		#@top = 
		#@bottom = 
		#@address = 
		#@newOrder=Order.create(params[:merchant_id])
	end

	def get_lineItems
		location = params[:location]
		distance = params[:distance]
		merchant_radius = User.within(10, :origin => params[:location]).where(role: "merchant")
		#merchant_radius = User.within(distance, :origin => location).where(role: "merchant")
		#merchants = User.find(:all, :origin=>'#{zipcode}', :conditions=>'distance<10').where(role:"merchant")
		unless merchant_radius
			render json: {error: "oops! error! :( "}, status: 404
			return
		end

		render json: merchant_radius, status: 201
	end



end

