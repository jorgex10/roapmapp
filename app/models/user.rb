# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :company

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
end
