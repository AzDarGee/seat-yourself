class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception




  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  protected
  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) << :user_name
   devise_parameter_sanitizer.for(:account_update) << :user_name
  end


end
