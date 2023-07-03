module Api
    class SessionsController < Devise::SessionsController
      skip_before_action :verify_authenticity_token, only: [:create_kitchen]
      before_action :authenticate_user!, except: [:create_kitchen]
      before_action :authenticate_kitchen_user!, only: [:create_kitchen]
  
      def create_kitchen
        user = User.find_by(email: params[:user][:email], role: 1)
      
        if user && user.valid_password?(params[:user][:password])
          sign_in(user)
          render json: { message: 'Inicio de sesión de cocina exitoso', user: user }, status: :ok
        else
          render json: { error: 'Credenciales de cocina inválidas' }, status: :unauthorized
        end
      end
  
      def destroy
        sign_out(current_user)
        render json: { message: 'Cierre de sesión exitoso' }, status: :ok
      end
  
      private
  
      def authenticate_kitchen_user!
        user = User.find_by(email: params[:user][:email])
        return if user && user.role == "kitchen"
  
        render json: { message: 'Acceso denegado', user: user }, status: :unauthorized
      end
    end
  end
  