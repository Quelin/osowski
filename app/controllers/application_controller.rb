class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  layout :admin_layout
  respond_to :html, :xml, :json, :js
  protect_from_forgery with: :exception
  before_action :authenticate_user!

before_action :configure_permitted_parameters, if: :devise_controller? 

protected def configure_permitted_parameters 
devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :lastname, :firma, :nazwa, :REGON, :NIP, :phone, :kod, :ulica, :miasto, :admin, :description])
devise_parameter_sanitizer.permit(:account_update, keys: [:name, :lastname, :firma, :nazwa, :REGON, :NIP, :phone, :kod, :ulica, :miasto, :admin, :description])
end
private

 def admin_layout
    # Check if logged in, because current_user could be nil.
    if user_signed_in? and current_user.admin?
      "admin"
    else
      "application"
    end
  end


  end

