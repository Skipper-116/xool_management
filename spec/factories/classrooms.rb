# frozen_string_literal: true

FactoryBot.define do
  factory :classroom do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    space { Faker::Number.number(digits: 2) }
  end
end
