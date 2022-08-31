class UserRole < ApplicationRecord
  belongs_to :role
  belongs_to :person
end
