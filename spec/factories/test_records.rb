# frozen_string_literal: true

FactoryBot.define do
  factory :test_record do
    association :classroom
    association :subject
    association :person
    association :cohort_term
    title { Faker::Lorem.word }
    content { Faker::Lorem.sentence }
    other_resources { Faker::Lorem.sentence }
    start_date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    end_date { Faker::Date.between(from: Date.today, to: 2.days.from_now) }
    results_available { Faker::Boolean.Date }
  end
end
