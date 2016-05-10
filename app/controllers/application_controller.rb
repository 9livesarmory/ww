class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
		if resource.role=="client"
			client_id=resource.id
  		search_path

		elsif resource.role=="merchant"
			merchant_id=resource.id
			merchant_orders_path(merchant_id)  
		end

	end
	
  protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, :role]
		devise_parameter_sanitizer.for(:account_update) << [:first_name, :last_name, :phone, :email, :street, :city, :state, :zipcode]
	end
end
