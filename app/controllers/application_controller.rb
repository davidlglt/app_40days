class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  #SURTOUT NE PAS ENLEVER LA LIGNE PROECT_FROM_FORGERY
  protect_from_forgery with: :exception

  #pundit
  before_action :authenticate_user!
  include Pundit

  before_action :configure_permitted_parameters,  if: :devise_controller?

  after_action :verify_authorized, except: :index, unless: :devise_or_admin_controller?
  after_action :verify_policy_scoped, only: :index, unless: :devise_or_admin_controller?

   rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :address, :password, :phone_number, :city, :zip_code, :country, :remember_me) }
  end

  def default_url_options
    { host: ENV['HOST'] || 'localhost:3000' }
  end

  def devise_or_admin_controller?
    devise_controller? || params[:controller] =~ /admin/
  end

end
