# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.connection.execute('SET FOREIGN_KEY_CHECKS = 0')
person = Person.new(birthdate: Date.today, gender_id: 1, creator: 1)
person.save!
puts "person errors: #{person.errors.full_messages}" if person.errors.any?
# enable referential integrity
ActiveRecord::Base.connection.execute('SET FOREIGN_KEY_CHECKS = 1')

# Start transaction
# rubocop:disable Metrics/BlockLength
ActiveRecord::Base.transaction do
  # disable referential integrity
  PersonName.create(given_name: 'Super', family_name: 'User', person: Person.first, creator: Person.first.id)
  User.create(username: 'superuser', password: 'password', person: Person.first, creator: Person.first.id)
  UserRole.create(person: Person.first, role: Role.first, creator: Person.first.id)
  # these are the input types that are used to create the person attributes
  InputType.create(name: 'text', pattern: '^[a-zA-Z0-9_]*$', creator: Person.first.id)
  InputType.create(name: 'number', pattern: '^[0-9]*$', creator: Person.first.id)
  InputType.create(name: 'date', pattern: '^[0-9]{4}-[0-9]{2}-[0-9]{2}$', creator: Person.first.id)
  InputType.create(name: 'email', pattern: '^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$', creator: Person.first.id)
  InputType.create(name: 'textarea', pattern: '^[a-zA-Z0-9_]*$', creator: Person.first.id)
  InputType.create(name: 'select', creator: Person.first.id)
  InputType.create(name: 'tel', pattern: '^[0-9]{10}$', creator: Person.first.id)
  InputType.create(name: 'radio', creator: Person.first.id)
  InputType.create(name: 'checkbox', creator: Person.first.id)
  InputType.create(name: 'file', creator: Person.first.id)
  InputType.create(name: 'month', creator: Person.first.id)
  InputType.create(name: 'week', creator: Person.first.id)
  InputType.create(name: 'time', creator: Person.first.id)
  InputType.create(name: 'datetime-local', pattern: '^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}$',
                   creator: Person.first.id)
  InputType.create(name: 'url', pattern: '^(http|https)://[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$', creator: Person.first.id)
  InputType.create(name: 'image', creator: Person.first.id)
  InputType.create(name: 'color', creator: Person.first.id)

  # these are the person attributes that are used to create the person attributes
  PersonAttributeType.create(name: 'Email Address', description: 'Email Address', is_required: false,
                             input_types_id: 4, creator: Person.first.id)
  PersonAttributeType.create(name: 'Phone Number', description: 'Phone Number', is_required: true, input_types_id: 7,
                             creator: Person.first.id)
  PersonAttributeType.create(name: 'Physical Address', description: 'Physical Address', is_required: false,
                             input_types_id: 1, creator: Person.first.id)
  PersonAttributeType.create(name: 'Postal Address', description: 'Postal Address', is_required: false,
                             input_types_id: 1, creator: Person.first.id)
  PersonAttributeType.create(name: 'Education', description: 'Highest education attained', is_required: false,
                             input_types_id: 1, creator: Person.first.id)
  PersonAttributeType.create(name: 'Occupation', description: 'Occupation', is_required: false, input_types_id: 1,
                             creator: Person.first.id)

  Gender.create([{ name: 'Male', description: 'Human with male genitals', creator: Person.first.id },
                 { name: 'Female', description: 'Human with female genitals', creator: Person.first.id },
                 { name: 'Artificial Intelligence', description: 'The system robot', creator: Person.first.id }])

  Role.create([{ name: 'Administrator', description: 'Most likely the IT personnel', creator: Person.first.id },
               { name: 'Head Teacher', description: 'Head teacher or Principal', creator: Person.first.id },
               { name: 'Deputy Head Teacher', description: 'Deputizing the Principal', creator: Person.first.id },
               { name: 'Teacher', description: 'Orients or teaches the school pupils', creator: Person.first.id },
               { name: 'Senior Accountant', description: 'Chief accountant of the school', creator: Person.first.id },
               { name: 'Accountant', description: 'One who is responsible for school accounts',
                 creator: Person.first.id },
               { name: 'Student', description: 'Person seeking knowledge', creator: Person.first.id },
               { name: 'Guardian', description: 'Person who is responible for the student', creator: Person.first.id }])

  RelationshipType.create(a_is_to_b: 'Father', b_is_to_a: 'Son', description: 'Father to son relationship',
                          creator: Person.first.id)
end
# rubocop:enable Metrics/BlockLength
