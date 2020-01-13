# frozen_string_literal: true

module Auth
  class AuthRequest
    attr_reader :access_token, :errors

    def initialize(access_token)
      @access_token = access_token
      @errors = []
    end

    def call
      if valid_token? && !session_expired?
        user
      else
        errors
      end
    end

    private

    def valid_token?
      return true if session

      errors << 'Invalid token.'
      false
    end

    def session_expired?
      expired_value = session.expired?
      errors << 'Session expired' if expired_value
      expired_value
    end

    def session
      @session ||= Session.find_by(access_token: access_token)
    end

    def user
      @user ||= session&.user
    end
  end
end
