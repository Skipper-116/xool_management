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
    params[:person_name_params][:person_id] = person.id
    PersonName.create(params[:person_name_params])
    PersonAttributeService.new.create_attribute(person, params[:person_attributes])
    User.create(
      username: params[:username] || find_user_email(person) || person.id,
      password: SecureRandom.base64[0..7]
    )
    UserRoleService.create_user_roles(person, params[:roles])
  end

  def process_student(person, pupils)
    pupils.each do |pupil|
      student = common_create(pupil)
      RelationshipService.new.create_relationship(person.id, student.id, pupil[:relationship_type])
    end
  end

  private

  def find_user_email(person)
    person.person_attributes.where(name: 'Email Address')&.first&.attribute_value
  end
end
