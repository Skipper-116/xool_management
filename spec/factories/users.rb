# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { Faker::Internet.email }
    password_digest { Faker::Lorem.word }
    password_recovery_digest { Faker::Lorem.word }
  end
end
