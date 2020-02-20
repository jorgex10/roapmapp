# frozen_string_literal: true

FactoryBot.define do
  factory :session do
    before(:create) { set_access_token }
    before(:create) { set_expires_at }

    user
  end
end
