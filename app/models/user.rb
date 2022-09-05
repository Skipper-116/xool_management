class User < ApplicationRecord
  has_secure_password
  has_secure_password :recover_password, validations: false
  belongs_to :person
end
