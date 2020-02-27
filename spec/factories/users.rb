# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.unique.first_name }
    last_name { Faker::Name.unique.last_name }
    email { "#{first_name.downcase}.#{last_name.downcase}@demo.com" }
    status { :active }
    password { Faker::Hacker.ingverb }

    company

    trait :inactive do
      status { :inactive }
    end
  end
end
