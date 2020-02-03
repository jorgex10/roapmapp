# frozen_string_literal: true

module Auth
  class LoginService
    attr_reader :email, :password, :session, :errors

    def initialize(email, password)
      @email = email
      @password = password
      @session = nil
      @errors = []
    end

    def call
      return errors unless valid?

      @session = create_new_session if valid_password?
      @session
    end

    private

    def valid?
      valid_email? &&
        present_password? &&
        active_user?
    end

    def create_new_session
      user.sessions.create
    end

    def valid_password?
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

    def present_password?
      present_password = password.present?
      errors << 'Password can\'t be blank.' unless present_password

      present_password
    end

    def active_user?
      active_user = user&.active?
      errors << 'User is inactive.' unless active_user

      active_user
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
