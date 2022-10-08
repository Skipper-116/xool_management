# frozen_string_literal: true

FactoryBot.define do
  factory :teacher_registry do
    association :person
    association :cohort
    association :captured_by, factory: :person
    present { Faker::Boolean.boolean }
    absent_reason { Faker::Lorem.word }
  end
end
