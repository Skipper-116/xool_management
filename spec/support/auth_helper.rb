# frozen_string_literal: true

module AuthHelper
  def self.http_login
    @http_login ||= begin
      token = JsonWebToken.encode({ person_id: EncryptorDecryptor.encrypt(Person.first.id), name: Person.first.name,
                                    roles: User.first.roles.map(&:name), username: User.first.username }, '127.0.0.1')
      "Bearer #{token}"
    end
  end
end
