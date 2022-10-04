# frozen_string_literal: true

# this is the main controller
class ApplicationController < ActionController::API
  # before_action :authorize_request

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      decoded = JsonWebToken.decode(header, request.remote_ip)
      User.current = User.find(EncryptorDecryptor.decrypt(decoded[:person_id]))
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'Invalid authorization code' }, status: :unauthorized
    rescue JWT::DecodeError
      render json: { errors: 'Invalid authorization code' }, status: :unauthorized
    end
  end
end
