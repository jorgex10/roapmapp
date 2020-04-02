# frozen_string_literal: true

FactoryBot.define do
  factory :task_image do
    image_data { 'https://res.cloudinary.com/dqipfc8vz/image/upload/v1585799593/public/uploads/cache/a6c6731f8559db885b693d95ecdad8c9.jpg' }

    task
  end
end
