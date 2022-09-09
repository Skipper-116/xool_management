# frozen_string_literal: true

# Person service class
class PersonService
  def self.create_person(params)
    person = Person.create(params[:person_params])
    roles_params.each do |role|
      person.roles << Role.find(role)
    end
    user = User.create(user_params)

    person
  end

  def self.update_person(person, person_params)
    person.update(person_params)
    person
  end

  def self.destroy_person(person)
    person.destroy
  end
end
