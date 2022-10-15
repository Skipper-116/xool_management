# frozen_string_literal: true

# this is the main controller
class ApplicationController < ActionController::API
  include ExceptionHandler
  before_action :authorize_request

  def authorize_request
    header = request.headers['Authorization']
    content = header.split(' ')
    auth_scheme = content.first
    raise ExceptionHandler::MissingToken, 'Missing token' unless header
    raise ExceptionHandler::InvalidToken, 'Invalid token' unless auth_scheme == 'Bearer'

    process_token(content.last)
  end

  private

  def process_token(token)
    decoded = JsonWebToken.decode(token, request.remote_ip)
    User.current = User.find(EncryptorDecryptor.decrypt(decoded[:person_id]))
  end
end
