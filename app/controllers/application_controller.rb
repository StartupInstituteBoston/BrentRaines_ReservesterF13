class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :update_permitted_parameters, if: :devise_controller?

  protected

    def update_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :password, :password_confirmation, :current_password) }
    end

end
