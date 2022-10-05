class ApplicationController < ActionController::Base
	before_action :authenticate_user!

	skip_before_action :authenticate_user!, only: [:landing_page]


 	before_action :configure_permitted_parameters, if: :devise_controller?

  	protected

  def configure_permitted_parameters
    attributes = [:name, :website,:username, :bio, :email, :phone, :gender, :avatar]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end
end
