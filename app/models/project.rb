# frozen_string_literal: true

class Project < ApplicationRecord
  enum status: { inactive: 0, active: 1 }

  belongs_to :company

  validates :name, :init_date, :end_date, presence: true
  validates :name, uniqueness: true
  validate :date_constraint

  def date_constraint
    errors.add(:end_date, 'must be greater than init date') if init_date > end_date
  end
end
