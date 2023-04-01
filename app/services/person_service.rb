# frozen_string_literal: true

# Person service class
class PersonService
  attr_accessor :mailable

  def initialize
    @mailable = []
  end

  def create_person(params)
    Person.transaction do
      common_create(params)
      process_student(person, params[:pupils]) unless params[:pupils]
    end
    person
  end

  private

  def common_create(params)
    person = Person.create!(params[:person_params])
    params[:person_name_params][:person_id] = person.id
    PersonName.create!(params[:person_name_params])
    PersonAttributeService.new.create_attribute(person, params[:person_attributes])
    mailable << UserService.new.create_user(person:, username: params[:username], passwor: [:password]).mailable
    UserRoleService.create_user_roles(person:, roles: params[:roles])
  end

  def process_student(person, pupils)
    pupils.each do |pupil|
      student = common_create(pupil)
      RelationshipService.new.create_relationship(person.id, student.id, pupil[:relationship_type])
    end
  end
end
