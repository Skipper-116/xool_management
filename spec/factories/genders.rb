# frozen_string_literal: true

FactoryBot.define do
  factory :gender do
    name { Faker.lorem.word }
    description { Faker.lorem.sentence }
  end
end
