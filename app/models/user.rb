# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  enum status: { inactive: 0, active: 1 }

  belongs_to :company
  has_many :sessions
  has_many :user_projects
  has_many :projects, through: :user_projects

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
