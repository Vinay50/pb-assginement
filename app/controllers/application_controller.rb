class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  before_action :set_user

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  def after_sign_in_path_for(source)
    root_path
  end

  private

  def set_user
    @user = current_user
  end

 def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
  update_attrs = [:password, :password_confirmation, :current_password]
  devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
  end
end
