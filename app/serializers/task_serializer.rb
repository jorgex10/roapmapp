# frozen_string_literal: true

class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :group_id, :category_id, :owner_id

  has_many :task_images
end
