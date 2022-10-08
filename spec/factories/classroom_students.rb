# frozen_string_literal: true

FactoryBot.define do
  factory :classroom_student do
    classroom
    cohort_term
    person
  end
end
