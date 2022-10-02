# frozen_string_literal: true

##
# This class will manage all user related operation
class UserService
  attr_accessor :mailable

  def initialize
    @mailable = nil
  end

  def create_user(person, username)
    User.create(
      person: person,
      username: username || find_user_email(person) || person.id,
      password: generate_password
    )
  end

  private

  def find_user_email(person)
    person.person_attributes.where(name: 'Email Address')&.first&.attribute_value
  end

  def generate_password(person)
    password = SecureRandom.base64[0..7]
    email = find_user_email(person)
    # send the user email here
    @mailable = { password: password, email: email } unless email.blank?
    password
  end
end
