# frozen_string_literal: true

FactoryBot.define do
  factory :relationship do
    association :person_a, factory: :person
    association :person_b, factory: :person
    association :relationship_type
  end
end
