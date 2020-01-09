# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :projects
  has_many :users

  validates :name, :url, presence: true, uniqueness: true
end
