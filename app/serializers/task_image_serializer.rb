# frozen_string_literal: true

class TaskImageSerializer < ActiveModel::Serializer
  attribute :id
  attribute :image_data, key: :url
end
