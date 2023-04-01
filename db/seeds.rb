# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


if Person.count.zero?
  ActiveRecord::Base.connection.execute('SET FOREIGN_KEY_CHECKS = 0')
  person = Person.new(birthdate: Date.today, gender_id: 1, creator: 1)
  person.save!
  puts "person errors: #{person.errors.full_messages}" if person.errors.any?
  # enable referential integrity
  ActiveRecord::Base.connection.execute('SET FOREIGN_KEY_CHECKS = 1')
end

# Start transaction
# rubocop:disable Metrics/BlockLength
ActiveRecord::Base.transaction do
  # disable referential integrity
  PersonName.find_or_create_by!(given_name: 'Super', family_name: 'User', person: Person.first, creator: Person.first.id)
  User.create!(username: 'superuser', password: 'password', person: Person.first, creator: Person.first.id)
  UserRole.find_or_create_by!(person: Person.first, role: Role.first, creator: Person.first.id)
  # these are the input types that are used to create the person attributes
  InputType.find_or_create_by!(name: 'text', pattern: '^[a-zA-Z0-9_]*$', creator: Person.first.id)
  InputType.find_or_create_by!(name: 'number', pattern: '^[0-9]*$', creator: Person.first.id)
  InputType.find_or_create_by!(name: 'date', pattern: '^[0-9]{4}-[0-9]{2}-[0-9]{2}$', creator: Person.first.id)
  InputType.find_or_create_by!(name: 'email', pattern: '^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$', creator: Person.first.id)
  InputType.find_or_create_by!(name: 'textarea', pattern: '^[a-zA-Z0-9_]*$', creator: Person.first.id)
  InputType.find_or_create_by!(name: 'select', creator: Person.first.id)
  InputType.find_or_create_by!(name: 'tel', pattern: '^[0-9]{10}$', creator: Person.first.id)
  InputType.find_or_create_by!(name: 'radio', creator: Person.first.id)
  InputType.find_or_create_by!(name: 'checkbox', creator: Person.first.id)
  InputType.find_or_create_by!(name: 'file', creator: Person.first.id)
  InputType.find_or_create_by!(name: 'month', creator: Person.first.id)
  InputType.find_or_create_by!(name: 'week', creator: Person.first.id)
  InputType.find_or_create_by!(name: 'time', creator: Person.first.id)
  InputType.find_or_create_by!(name: 'datetime-local', pattern: '^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}$',
                               creator: Person.first.id)
  InputType.find_or_create_by!(name: 'url', pattern: '^(http|https)://[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$', creator: Person.first.id)
  InputType.find_or_create_by!(name: 'image', creator: Person.first.id)
  InputType.find_or_create_by!(name: 'color', creator: Person.first.id)

  # these are the person attributes that are used to create the person attributes
  PersonAttributeType.find_or_create_by!(name: 'Email Address', description: 'Email Address', is_required: false,
                             input_types_id: 4, creator: Person.first.id)
  PersonAttributeType.find_or_create_by!(name: 'Phone Number', description: 'Phone Number', is_required: true, input_types_id: 7,
                             creator: Person.first.id)
  PersonAttributeType.find_or_create_by!(name: 'Physical Address', description: 'Physical Address', is_required: false,
                             input_types_id: 1, creator: Person.first.id)
  PersonAttributeType.find_or_create_by!(name: 'Postal Address', description: 'Postal Address', is_required: false,
                             input_types_id: 1, creator: Person.first.id)
  PersonAttributeType.find_or_create_by!(name: 'Education', description: 'Highest education attained', is_required: false,
                             input_types_id: 1, creator: Person.first.id)
  PersonAttributeType.find_or_create_by!(name: 'Occupation', description: 'Occupation', is_required: false, input_types_id: 1,
                             creator: Person.first.id)

  Gender.find_or_create_by!([{ name: 'Male', description: 'Human with male genitals', creator: Person.first.id },
                 { name: 'Female', description: 'Human with female genitals', creator: Person.first.id },
                 { name: 'Artificial Intelligence', description: 'The system robot', creator: Person.first.id }])

  Role.find_or_create_by!([{ name: 'Administrator', description: 'Most likely the IT personnel', creator: Person.first.id },
               { name: 'Head Teacher', description: 'Head teacher or Principal', creator: Person.first.id },
               { name: 'Deputy Head Teacher', description: 'Deputizing the Principal', creator: Person.first.id },
               { name: 'Teacher', description: 'Orients or teaches the school pupils', creator: Person.first.id },
               { name: 'Senior Accountant', description: 'Chief accountant of the school', creator: Person.first.id },
               { name: 'Accountant', description: 'One who is responsible for school accounts',
                 creator: Person.first.id },
               { name: 'Student', description: 'Person seeking knowledge', creator: Person.first.id },
               { name: 'Guardian', description: 'Person who is responible for the student', creator: Person.first.id }])

RelationshipType.find_or_create_by!(a_is_to_b: 'Father', b_is_to_a: 'Son', description: 'Father to son relationship',
                          creator: Person.first.id)
end
# rubocop:enable Metrics/BlockLength
