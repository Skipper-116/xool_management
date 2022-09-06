# frozen_string_literal: true

# controller handling authentication
class Api::V1::AuthenticationController < ActionController::API
  def login
    auth_token = authenticate_user
    if auth_token
      json_response(auth_token: JsonWebToken.encode({ person_id: EncryptorDecryptor.encrypt(auth_token.person_id), name: auth_token.person.name,
                                                      roles: auth_token.roles.map(&:name), username: auth_params[:username] }, request.remote_ip))
    else
      json_response({ message: 'Incorrect Username or Password provided' }, :unauthorized)
    end
  end

  private

  def authenticate_user
    response = User.where(username: auth_params[:username])&.first

    return nil if response.blank?

    return nil unless response.authenticate(auth_params[:password])

    response
  end

  def auth_params
    params.permit(:username, :password)
  end

  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
