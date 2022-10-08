# frozen_string_literal: true

FactoryBot.define do
  factory :profile_picture do
    person
    image_url { Faker::Lorem.word }
  end
end
