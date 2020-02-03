# frozen_string_literal: true

module Members
  class RegistrationService
    attr_reader :member_params, :errors

    def initialize(member_params)
      @member_params = member_params
      @errors = []
    end

    def call
      true
    end
  end
end
