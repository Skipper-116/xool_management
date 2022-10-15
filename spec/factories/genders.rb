# frozen_string_literal: true

FactoryBot.define do
  factory :gender do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
  end
end
