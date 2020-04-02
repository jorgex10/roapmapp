# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    name { 'MyString' }
    description { 'MyText' }
    owner_id { '' }
  end
end
