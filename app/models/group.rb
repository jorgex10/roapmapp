# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :project

  validates :name, :init_date, :end_date, presence: true
  validates :name, uniqueness: true
end
