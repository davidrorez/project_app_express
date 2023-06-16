class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  def new
    @user = User.new
  end
  
  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:role])
  end

  #ver porqué no funciona
  def after_sign_up_path_for(resource)
    new_user_session_path
  end
end
