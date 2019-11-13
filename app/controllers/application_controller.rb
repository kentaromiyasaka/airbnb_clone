class ApplicationController < ActionController::Base
  before_action :configure_permitted_paramaters, if: :devise_controller?
  include UsersHelper
  include RoomsHelper

  protected
  def configure_permitted_paramaters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:fullname, :description, :phone_number])
  end
end
