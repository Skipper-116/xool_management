# frozen_string_literal: true

FactoryBot.define do
  factory :classroom do
    name { Faker::Lorem.word }
    describe { Faker::Lorem.sentence }
    school
    grade
    classroom_type
  end
end
