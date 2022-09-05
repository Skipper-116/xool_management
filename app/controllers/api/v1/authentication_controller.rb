# frozen_string_literal: true

# controller handling authentication
class Api::V1::AuthenticationController < ActionController::API
  def login
    auth_token = authenticate_user
    if auth_token
      json_response(auth_token: JsonWebToken.encode({ person_id: encrypt_person_id(auth_token.person_id), name: auth_token.person.name,
                                                      roles: auth_token.roles.map(&:name) }, request.remote_ip))
    else
      json_response({ message: 'Incorrect Username or Password provided' }, :unauthorized)
    end
  end

  private

  def encrypt_person_id(person_id)
    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base[0..31])
    crypt.encrypt_and_sign(person_id)
  end

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
