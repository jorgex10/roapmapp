# frozen_string_literal: true

class ApiV1Controller < ApplicationController
  before_action :authenticate_request

  attr_reader :current_user, :current_company

  def authenticate_request
    auth_request_service = Auth::AuthRequest.new(header_authorization)
    auth_request_service.call
    errors = auth_request_service.errors

    if errors.empty?
      @current_user = auth_request_service.user
      @current_company = @current_user.company
    else
      render json: ErrorResponse.unauthorized(errors), status: :unauthorized
    end
  end

  private

  def header_authorization
    @header_authorization ||= request.headers['Authorization']
  end
end
