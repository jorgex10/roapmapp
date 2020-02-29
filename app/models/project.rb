# frozen_string_literal: true

class Project < ApplicationRecord
  enum status: { inactive: 0, active: 1 }

  belongs_to :company
  has_many :categories
  has_many :groups
  has_many :user_projects
  has_many :members, through: :user_projects, source: :user

  validates :name, :init_date, :end_date, presence: true
  validates :name, uniqueness: true
  validate :date_constraint

  def date_constraint
    return false unless valid_dates?

    errors.add(:end_date, 'must be greater than init date') if init_date > end_date
  end

  private

  def valid_dates?
    init_date.present? && end_date.present?
  end
end
