# frozen_string_literal: true

module Auth
  class AuthUser
    attr_reader :email, :password, :session, :errors

    def initialize(email, password)
      @email = email
      @password = password
      @session = nil
      @errors = []
    end

    def call
      return errors unless valid?

      @session = create_new_session if correct_password?
      @session
    end

    private

    def valid?
      valid_email? && valid_password?
    end

    def create_new_session
      user.sessions.create
    end

    def correct_password?
      correct_password = user&.authenticate(password)
      errors << 'Invalid credentials.' unless correct_password
      correct_password
    end

    def user
      @user ||= User.find_by_email(email)
    end

    def valid_email?
      email_present? && valid_email_format?
    end

    def valid_password?
      password_present = password.present?
      errors << 'Password can\'t be blank.' unless password_present
      password_present
    end

    def email_present?
      email_present = email.present?
      errors << 'Email can\'t be blank.' unless email_present
      email_present
    end

    def valid_email_format?
      match = email.match(/\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
      errors << 'Email format is incorrect.' unless match
      match
    end
  end
end
