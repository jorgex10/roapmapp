# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :company

  validates :name, :init_date, :end_date, presence: true
  validates :name, uniqueness: true
end
