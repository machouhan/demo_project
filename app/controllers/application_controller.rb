class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address, :contact, :role])
	end

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:log_in, keys: [:role])
	end
end
