# frozen_string_literal: true

class UserRole < VoidableRecord
  belongs_to :role
  belongs_to :person
end
