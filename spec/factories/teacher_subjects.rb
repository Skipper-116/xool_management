# frozen_string_literal: true

FactoryBot.define do
  factory :teacher_subject do
    association :person
    association :subject
  end
end
