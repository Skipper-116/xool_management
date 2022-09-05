# frozen_string_literal: true

# this is the class handling encryption and descryption
class EncryptorDecryptor
  CRYPTO = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base[0..31])

  def self.encrypt(content)
    CRYPTO.encrypt_and_sign(content)
  end

  def self.decrypt(content)
    CRYPTO.decrypt_and_verify(content)
  end
end
