class Users::SessionsController < Devise::SessionsController
  before_action :check_admin_role, only: [:create]
  before_action :check_invalid_credentials, only: [:create]

  private

  def check_admin_role
    user = User.find_by(email: params[:user][:email])

    if user.nil?
      flash[:alert] = "El correo electrónico no existe"
      redirect_to new_user_session_path
    elsif user.role != "admin"
      flash[:alert] = "No eres administrador"
      redirect_to new_user_session_path
    end 
  end


  def check_invalid_credentials
    user = User.find_by(email: params[:user][:email])

    if user.nil? || !user.valid_password?(params[:user][:password])
      flash[:alert] = "Correo o contraseña inválidos."
      redirect_to new_user_session_path
    end 
  end

  def initialize_user_object
    @user = User.new(user_params)
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
