# frozen_string_literal: true

class Project < ApplicationRecord
  enum status: { inactive: 0, active: 1 }

  belongs_to :company

  validates :name, :init_date, :end_date, presence: true
  validates :name, uniqueness: true
end
