class OrdersController < ApplicationController
#merch order controller
skip_before_action :verify_authenticity_token  #needs to be removed and add protect from forgery!!
before_action :authenticate_user!

	def index
		@merchant_id=params[:merchant_id]
		@current_merchant = User.find_by("id = ?", @merchant_id)
		@orders=Order.where("merchant_id = ?", @merchant_id)

		#@client_names = User.joins(:orders).where("merchant_id = ?", @merchant_id)
		#need to get client_ids associated with this merchant and then show the names

		render 'index'
	end

	def show
		
	end

	def new
		@newOrder = Order.new

		@shirt=Item.find_by(" name = ? ", "shirt")
		@pants=Item.find_by(" name = ? ", "pants")
		@onepiece=Item.find_by(" name = ?", "onepiece")

		render 'new'
	end

	def create
		@newOrder=Order.create(params[:merchant_id])

		redirect_to(search_path)
	end


	def priceChecker
		shirt=Item.find_by(" name = ? ", "shirt")
		pants=Item.find_by(" name = ? ", "pants")
		onepiece=Item.find_by(" name = ?", "onepiece")


		total_shirtPrice = ((params[:shirtQuantity].to_i) * shirt.price.to_i)
		total_pantsPrice = ((params[:pantsQuantity].to_i) * pants.price.to_i)
		total_onepiecePrice = ((params[:onepieceQuantity].to_i) * onepiece.price.to_i)

		order_totalPrice = (total_shirtPrice) + (total_pantsPrice) + (total_onepiecePrice)

		#render json: {shirts: total_shirtPrice, pants: total_pantsPrice, onepiece: total_onepiecePrice}, status: 201
		render json: order_totalPrice, status: 201
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


	private

	def order_params
		params.require(:order).permit(:merchant_id, :client_id)
	end

end

