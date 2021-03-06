# frozen_string_literal: true

class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :status, :init_date, :end_date

  has_many :members
  has_many :categories
  has_many :groups
end
