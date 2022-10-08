# frozen_string_literal: true

FactoryBot.define do
  factory :student_registry do
    association :classroom
    association :cohort_term
    association :person
    association :captured_by, factory: :user
    present { Faker::Boolean.boolean }
    absent_reason { Faker::Lorem.word }
  end
end
