# frozen_string_literal: true

class Task < ApplicationRecord
  enum status: {
    created: 0,
    todo: 1,
    wip: 2,
    hold: 3,
    review: 4,
    done: 5,
    archived: 6,
    cancelled: 7
  }

  belongs_to :group, optional: true
  belongs_to :category, optional: true
  belongs_to :owner, class_name: 'User'
  has_many :task_images, inverse_of: :task

  validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :task_images
end
