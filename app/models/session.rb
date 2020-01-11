# frozen_string_literal: true

class Session < ApplicationRecord
  belongs_to :user

  validates :access_token, :refresh_token, presence: true

  before_create :set_expires_at

  def set_expires_at
    self.expires_at = 2.days.after
  end

  def expired?
    Time.current > expires_at
  end
end
