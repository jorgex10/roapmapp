# frozen_string_literal: true

FactoryBot.define do
  factory :group do
    name { Faker::Team.unique.name }
    description { Faker::Lorem.paragraph }
    init_date { Faker::Date.between(from: Date.today.beginning_of_month, to: Date.today) }
    end_date { Faker::Date.between(from: 1.day.after, to: Date.today.end_of_month) }

    project
  end
end
