# frozen_string_literal: true

# Person service class
class PersonService
  def create_person(params)
    Person.transaction do
      common_create(params)
      process_student(person, params[:pupils]) unless params[:pupils]
    end
    person
  end

  def common_create(params)
    person = Person.create(params[:person_params])
    User.create(username: params[:username], password: SecureRandom.base64[0..7])
    UserRoleService.create_user_roles(person, params[:roles])
  end

  def process_student(person, pupils)
    pupils.each do |pupil|
      student = common_create(pupil)
      RelationshipService.new.create_relationship(person.id, student.id, pupil[:relationship_type])
    end
  end

  def self.update_person(person, person_params)
    person.update(person_params)
    person
  end

  def self.destroy_person(person)
    person.destroy
  end
end
