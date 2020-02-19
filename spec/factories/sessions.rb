# frozen_string_literal: true

FactoryBot.define do
  factory :session do
    access_token { Faker::Crypto.sha1 }
    expires_at { 2.days.after }

    user
  end
end
