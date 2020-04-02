# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :group, optional: true
  belongs_to :category, optional: true
  belongs_to :owner, class_name: 'User'
  has_many :task_images, inverse_of: :task

  validates :name, presence: true

  accepts_nested_attributes_for :task_images
end
