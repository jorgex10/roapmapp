# frozen_string_literal: true

class Session < ApplicationRecord
  belongs_to :user

  before_create :set_access_token, :set_refresh_token, :set_expires_at

  def set_access_token
    self.access_token = SecureRandom.hex(25)
  end

  def set_refresh_token
    self.refresh_token = SecureRandom.hex(25)
  end

  def set_expires_at
    self.expires_at = 2.days.after
  end

  def expired?
    Time.current > expires_at
  end
end
