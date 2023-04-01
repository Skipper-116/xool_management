# frozen_string_literal: true

##
# This class will manage all user related operation
class UserService
  attr_accessor :mailable

  def initialize
    @mailable = nil
  end

  def create_user(person:, username:, password:)
    password = generate_password if Rails.application.config_for(:application).generate_password && password.blank?
    user = User.create!(
      person:,
      password:,
      username: username || person.email || person.id
    )
    @mailable = { user:, password: } unless email.blank?
  end

  private

  def generate_password
    length = Rails.application.config_for(:application).password_length
    # this should create a random password that contains special characters and numbers as well
    SecureRandom.base64(length)
  end
end
