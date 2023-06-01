require "jwt"

class ApplicationController < ActionController::API
  include JsonWebToken
  before_action :authenticate_request

  private 

  def authenticate_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    llave = Rails.application.secrets.secret_key_base
    puts llave
    puts header
    decoded = JWT.decode(header, llave)[0]
    HashWithIndifferentAccess.new decoded
    puts User.find(decoded['user_id']).lastname
    @current_user = User.find(decoded['user_id'])
  end
end
