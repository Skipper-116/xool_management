# frozen_string_literal: true

FactoryBot.define do
  factory :person_attribute do
    person
    people_attribute_type
    attribute_value { Faker::Lorem.word }
  end
end
