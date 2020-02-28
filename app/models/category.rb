# frozen_string_literal: true

class Category < ApplicationRecord
  belongs_to :project

  validates :name, presence: true, uniqueness: true
end
