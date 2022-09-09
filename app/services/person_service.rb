# frozen_string_literal: true

# Person service class
class PersonService
  def self.create_person(params)
    Person.transaction do
      common_create(params)
      process_student(person, params[:pupils])
    end
    person
  end

  def self.common_create(params)
    person = Person.create(params[:person_params])
    UserRoleService.create_user_roles(person, params[:roles])
  end
  
  def self.process_student(person, pupils)
    pupils.each do |pupil|
      student = common_create(pupil)
      RelationshipService.create_relationship(person.id, student.id, pupil[:relationship_type])
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
