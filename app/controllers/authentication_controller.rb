require "jwt"

class AuthenticationController < ApplicationController
  
  skip_before_action :authenticate_request, only: [:login]

  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      variable_llave = Rails.application.secrets.secret_key_base
      user_payload = {user_id: @user.id,exp: 7.days.from_now.to_i}
      puts '---------------------------------------------------------'
      puts json: @user
      puts '----------------------------------------------------------'
      token = JWT.encode(user_payload,variable_llave)
      render json: { token: token,current_user: @user }, status: :ok
    else
      render json: { error: 'Invalid username or password '}, status: :unauthorized
    end
  end


end
