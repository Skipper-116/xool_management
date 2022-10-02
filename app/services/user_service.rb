# frozen_string_literal: true

##
# This class will manage all user related operation
class UserService
  attr_accessor :mailable

  def initialize
    @mailable = nil
  end

  def create_user(person, username)
    password = generate_password
    user = User.create(
      person:,
      password:,
      username: username || person.email || person.id
    )
    @mailable = { user:, password: } unless email.blank?
  end

  private

  def generate_password
    SecureRandom.base64[0..7]
  end
end
