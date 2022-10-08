# frozen_string_literal: true

FactoryBot.define do
  factory :classroom_facility do
    classroom
    name { Faker::Lorem.word }
    quantity { Faker::Number.number(digits: 2) }
    describe { Faker::Lorem.sentence }
  end
end
