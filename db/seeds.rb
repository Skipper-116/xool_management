# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# these are the input types that are used to create the person attributes
InputType.create(name: 'text', pattern: '^[a-zA-Z0-9_]*$')
InputType.create(name: 'number', pattern: '^[0-9]*$')
InputType.create(name: 'date', pattern: '^[0-9]{4}-[0-9]{2}-[0-9]{2}$')
InputType.create(name: 'email', pattern: '^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$')
InputType.create(name: 'textarea', pattern: '^[a-zA-Z0-9_]*$')
InputType.create(name: 'select')
InputType.create(name: 'tel', pattern: '^[0-9]{10}$')
InputType.create(name: 'radio')
InputType.create(name: 'checkbox')
InputType.create(name: 'file')
InputType.create(name: 'month')
InputType.create(name: 'week')
InputType.create(name: 'time')
InputType.create(name: 'datetime-local', pattern: '^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}$')
InputType.create(name: 'url', pattern: '^(http|https)://[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$')
InputType.create(name: 'image')
InputType.create(name: 'color')

# these are the person attributes that are used to create the person attributes
PersonAttributeType.create(name: 'Email Address', description: 'Email Address', is_required: false, input_types_id: 4)
PersonAttributeType.create(name: 'Phone Number', description: 'Phone Number', is_required: true, input_types_id: 7)
PersonAttributeType.create(name: 'Physical Address', description: 'Physical Address', is_required: false,
                           input_types_id: 1)
PersonAttributeType.create(name: 'Postal Address', description: 'Postal Address', is_required: false, input_types_id: 1)
PersonAttributeType.create(name: 'Education', description: 'Highest education attained', is_required: false,
                           input_types_id: 1)
PersonAttributeType.create(name: 'Occupation', description: 'Occupation', is_required: false, input_types_id: 1)

Gender.create([{ name: 'Male', description: 'Human with male genitals' },
               { name: 'Female', description: 'Human with female genitals' },
               { name: 'Artificial Intelligence', description: 'The system robot' }])

Role.create([{ name: 'Administrator', description: 'Most likely the IT personnel' },
             { name: 'Head Teacher', description: 'Head teacher or Principal' },
             { name: 'Deputy Head Teacher', description: 'Deputizing the Principal' },
             { name: 'Teacher', description: 'Orients or teaches the school pupils' },
             { name: 'Senior Accountant', description: 'Chief accountant of the school' },
             { name: 'Accountant', description: 'One who is responsible for school accounts' },
             { name: 'Student', description: 'Person seeking knowledge' },
             { name: 'Guardian', description: 'Person who is responible for the student' }])

Person.create(birthdate: Date.today, gender: Gender.find_by_name('Artificial Intelligence'))
PersonName.create(given_name: 'Super', family_name: 'User', person: Person.first)
User.create(username: 'superuser', password: 'password', person: Person.first)
UserRole.create(person: Person.first, role: Role.first)

RelationshipType.create(a_is_to_b: 'Father', b_is_to_a: 'Son', description: 'Father to son relationship')
