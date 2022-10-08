# frozen_string_literal: true

FactoryBot.define do
  factory :cohort do
    name { Faker::Lorem.word }
    short_name { Faker::Lorem.word }
    start_date { Faker::Date.between(from: 1.year.ago, to: 1.year.from_now) }
    end_date { Faker::Date.between(from: 1.year.ago, to: 1.year.from_now) }
    description { Faker::Lorem.sentence }
  end
end
