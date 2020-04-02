# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    name { Faker::Educator.unique.course_name }
    description { Faker::Lorem.paragraph }
    status { 0 }

    association :owner, factory: :user
    category
    group
  end
end
