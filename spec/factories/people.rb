# frozen_string_literal: true

FactoryBot.define do
  factory :person do
    birthdate { Faker::Date.birthday(min_age: 18, max_age: 65) }
    gender
    birthdate_estimated { Faker::Boolean.boolean }
  end
end
