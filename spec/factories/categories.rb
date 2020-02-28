# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name { Faker::Cannabis.strain }
    description { Faker::Lorem.paragraph }

    project
  end
end
