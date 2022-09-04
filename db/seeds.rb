# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Gender.create([{ name: 'Male', description: 'Human with male genitals' },
               { name: 'Female', description: 'Human with female genitals' }])

Role.create([{ name: 'Administrator', description: 'Most likely the IT personnel' },
             { name: 'Head Teacher', description: 'Head teacher or Principal' },
             { name: 'Deputy Head Teacher', description: 'Deputizing the Principal' },
             { name: 'Teacher', description: 'Orients or teaches the school pupils' },
             { name: 'Senior Accountant', description: 'Chief accountant of the school' },
             { name: 'Accountant', description: 'One who is responsible for school accounts' },
             { name: 'Student', description: 'Person seeking knowledge' },
             { name: 'Guardian', description: 'Person who is responible for the student' }])
