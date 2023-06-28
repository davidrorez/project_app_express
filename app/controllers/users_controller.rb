class UsersController < ApplicationController
  layout 'application'
  
  before_action :set_user, only: %i[ show edit update destroy ]

    def index
      @users = User.all
    end
  
    def show
      @user = User.find(params[:id])
    end
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
        if @user.save
          redirect_to user_url(@user), notice: 'Usuario creado exitosamente.'
        else
          render :new, status: :unprocessable_entity
        end
    end
  
    def edit
      @user = User.find(params[:id])
    end
  
    def update
      @user = User.find(params[:id])
        if @user.update(user_params)
          redirect_to user_url(@user), notice: 'Usuario actualizado exitosamente.' 
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
    end
  
    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to users_url, notice: 'Usuario eliminado exitosamente.'
    end
  
    private
  
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :role)
    end
end