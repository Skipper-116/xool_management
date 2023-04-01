# frozen_string_literal: true

# This class will manage all user related operation
class User < VoidableRecord
  has_secure_password
  # has_secure_password :recover_password, validations: false

  belongs_to :person
  has_many :user_roles, foreign_key: :person_id, dependent: :destroy
  has_many :roles, through: :user_roles

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create,
                       length: { minimum: Rails.application.config_for(:application).password_length }

  def self.current
    Thread.current['current_user']
  end

  def self.current=(user)
    Thread.current['current_user'] = user
  end
end
