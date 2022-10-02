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
    email = find_user_email(person)
    user = User.create(
      person: person,
      username: username || email || person.id,
      password: password
    )
    @mailable = { user: user, password: password } unless email.blank?
  end

  private

  def find_user_email(person)
    person.person_attributes.where(name: 'Email Address')&.first&.attribute_value
  end

  def generate_password
    SecureRandom.base64[0..7]
  end
end
