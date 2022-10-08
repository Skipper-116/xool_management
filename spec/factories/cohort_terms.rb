# frozen_string_literal: true

FactoryBot.define do
  factory :cohort_term do
    cohort
    name { Faker::Lorem.word }
    start_date { Faker::Date.between(from: 1.year.ago, to: 1.year.from_now) }
    end_date { Faker::Date.between(from: 1.year.ago, to: 1.year.from_now) }
  end
end
