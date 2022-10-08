# frozen_string_literal: true

FactoryBot.define do
  factory :test_result do
    association :test_record
    association :person
    # grade is a float
    grade { Faker::Number.decimal(l_digits: 2) }
  end
end
