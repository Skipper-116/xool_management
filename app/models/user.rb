class User < ApplicationRecord
  has_secure_password
  has_secure_password :recover_password, validations: false
  belongs_to :person

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: { minimum: 6 }

  def self.current
    Thread.current['current_user']
  end

  def self.current=(user)
    Thread.current['current_user'] = user
  end
end
