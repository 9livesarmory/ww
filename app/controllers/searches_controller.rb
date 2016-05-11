class SearchesController < ApplicationController

	before_action :authenticate_user!
	skip_before_action :verify_authenticity_token
	
	def index
		@merchants = User.within(1, :origin => [25.7745031,-80.1917512]).where(role: "merchant") #geokit method to get users within mile radius
	end


	def search_merchants
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