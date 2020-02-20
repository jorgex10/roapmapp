# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    name { Faker::App.unique.name }
    description { Faker::Lorem.paragraph }
    status { :active }
    init_date { Faker::Date.between(from: Date.today.beginning_of_year, to: Date.today) }
    end_date { Faker::Date.between(from: 1.day.after, to: Date.today.end_of_year) }

    company

    trait :inactive do
      status { :inactive }
    end
  end
end
