class UsersController < ApplicationController

	def new
		@newuser = User.new
	end

	def create
		@newuser=User.create(createUser_params)
	end


	private

	def createUser_params

		params.require(:?).permit(:first_name, :last_name , :email)
	end

end

