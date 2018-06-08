class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(source)
    # if source.is_a?(User)
    #   return rep_root_path if( source.is?(:admin) || source.is?(:agent) )
    #   return admin_root_path if source.is?(:super_admin)
    # else
    #   return rep_root_path
    # end
    root_path
  end

 def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
  update_attrs = [:password, :password_confirmation, :current_password]
  devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
  end
end
