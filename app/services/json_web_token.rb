# frozen_string_literal: true

# This class is used to encode and decode the JWT token
class JsonWebToken
  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s + Rails.application.config_for(:application).jwt_key
  SESSION_HRS = Rails.application.config_for(:application).session_hrs || 24

  def self.encode(payload, request_ip, exp = SESSION_HRS.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY + request_ip)
  end

  def self.decode(token, request_ip)
    decoded = JWT.decode(token, SECRET_KEY + request_ip)[0]
    HashWithIndifferentAccess.new decoded
  end
end
