# frozen_string_literal: true

FactoryBot.define do
  factory :relationship_type do
    a_is_to_b { Faker::Lorem.word }
    b_is_to_a { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
  end
end
