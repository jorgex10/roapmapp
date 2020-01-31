# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  enum status: { inactive: 0, active: 1 }

  belongs_to :company
  has_many :sessions

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
end
