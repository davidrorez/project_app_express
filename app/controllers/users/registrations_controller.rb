class Users::RegistrationsController < Devise::RegistrationsController
  layout 'login'
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  def create
    super do |resource|
      if resource.persisted?
        set_flash_message! :notice, :signed_up
        redirect_to new_user_session_path
        return 
      end
    end
  end
  
  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:role])
  end

end
