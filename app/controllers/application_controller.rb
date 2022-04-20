class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[full_name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[full_name])
    devise_parameter_sanitizer.permit :sign_in, keys: %i[email password]
  end
end
