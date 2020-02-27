# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    name { Faker::Company.unique.industry }
    url { "www.#{name.gsub(' ', '').underscore}.com" }
    address { Faker::Address.street_address }
    phone { Faker::PhoneNumber.cell_phone }
  end
end
