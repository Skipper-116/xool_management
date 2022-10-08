# frozen_string_literal: true

FactoryBot.define do
  factory :test_type do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    # scale is the part of the 100%
    scale { Faker::Number.between(1, 100) }
  end
end
