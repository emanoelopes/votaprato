class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:index, :show]
  include CanCan::ControllerAdditions
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  #def configure_permitted_parameters
  #  devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(
  #    :email, :password, :password_confirmation, :roles [] )}
  #end
  #
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    user_params.permit({ roles: [] }, :email, :password, :password_confirmation, :admin)
  end
  end 
end
