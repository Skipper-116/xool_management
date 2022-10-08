# frozen_string_literal: true

FactoryBot.define do
  factory :people_attribute_type do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    is_required { Faker::Boolean.boolean }
    input_type
  end
end
