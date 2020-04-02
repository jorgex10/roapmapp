# frozen_string_literal: true

FactoryBot.define do
  factory :task_image do
    task { '' }
    image_data { 'MyText' }
  end
end
