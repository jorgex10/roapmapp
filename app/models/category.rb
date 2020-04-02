# frozen_string_literal: true

class Category < ApplicationRecord
  belongs_to :project
  has_many :tasks

  validates :name, presence: true, uniqueness: true
end
