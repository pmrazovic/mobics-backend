class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery :with => :null_session
  # Permit extra parameters for user registration
  before_action :configure_permitted_parameters, :if => :devise_controller?

  protected

		def configure_permitted_parameters
			# Permit extra user parameter (username)
		  devise_parameter_sanitizer.for(:sign_up) << :username
		end
end
