class Project < ApplicationRecord
  validates :name, :init_date, :end_date, presence: true
  validates :name, uniqueness: true
end
