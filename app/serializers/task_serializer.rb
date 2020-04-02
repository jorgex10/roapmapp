# frozen_string_literal: true

class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :description

  belongs_to :owner
  belongs_to :group
  belongs_to :category
  has_many :task_images
end
