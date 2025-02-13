class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
 
  def admin_controller?
    self.class.module_parent_name == 'Admin'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
  


  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    flash[:notice] = "ログアウトしました"  # flashメッセージの追加もできます
    root_path
  end
end
