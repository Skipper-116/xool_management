# frozen_string_literal: true

# User roles service class
class UserRoleService
  def self.create_user_roles(person, roles)
    roles.each do |role|
      UserRole.create!(person_id: person.id, role_id: role)
    end
  end

  def self.update_user_roles(person, roles)
    UserRole.where(person_id: person.id).destroy_all
    create_user_roles(person, roles)
  end

  def self.destroy_user_roles(person)
    UserRole.where(person_id: person.id).destroy_all
  end
end
