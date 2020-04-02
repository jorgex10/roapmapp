# frozen_string_literal: true

class TaskImage < ApplicationRecord
  belongs_to :task, inverse_of: :task_images

  before_create :upload_image

  validates :image_data, presence: true

  def upload_image
    shrine_obj = Shrine.data_uri(image_data)
    image = Shrine.upload(shrine_obj, :cache, {})
    self.image_data = image.url
  rescue StandardError
    errors.add(:base, '64 invalid data')
  end
end
