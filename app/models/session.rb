# frozen_string_literal: true

class Session < ApplicationRecord
  belongs_to :user

  before_create :set_access_token, :set_expires_at

  def expired?
    Time.current > expires_at
  end

  def expire!
    update(
      access_token: expired_info,
      expires_at: 2.years.ago
    )
  end

  private

  def set_access_token
    self.access_token = SecureRandom.hex(25)
  end

  def set_expires_at
    self.expires_at = 2.days.after
  end

  def expired_info
    "expired_at_#{Time.current.strftime('%Y%m%d_%H%M%S')}"
  end
end
