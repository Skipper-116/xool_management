# frozen_string_literal: true

FactoryBot.define do
  factory :input_type do
    name { Faker::Lorem.word }
    pattern { Faker::Lorem.word }
  end
end
