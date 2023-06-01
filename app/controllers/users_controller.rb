class UsersController < ApplicationController
  before_action :set_user, only: [:show,:destroy]

  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def show
    @user = User.find(params[:id])
    render json: @user, status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    head :no_content
  end
  private 
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name,:lastname,:email,:edad,:photo,:cc,:direccion,:celular,:telofono,:password)
  end
end
