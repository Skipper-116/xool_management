# frozen_string_literal: true

FactoryBot.define do
  factory :user_role do
    association :person
    association :role
  end
end
