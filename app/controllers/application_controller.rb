class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters      
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :money, :nationality, :notes, :picture, :graffiti_image, :email, :password, :password_confirmation])

      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :money, :nationality, :notes, :picture, :graffiti_image, :email, :password, :password_confirmation])

    end  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  protect_from_forgery with: :exception
end
