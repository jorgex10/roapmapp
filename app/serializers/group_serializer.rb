# frozen_string_literal: true

class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :init_date, :end_date
end
