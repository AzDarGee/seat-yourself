class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) << :user_name
   devise_parameter_sanitizer.for(:account_update) << :user_name
  end

  private
  def is_customer
    current_user.is_a? Customer
  end
  def is_owner
    current_user.is_a? Owner
  end

  helper_method :is_customer, :is_owner
end
