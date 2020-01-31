# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActionController::ParameterMissing, with: :bad_request_response

  def bad_request_response(error)
    render json: ErrorResponse.bad_request(error), status: :bad_request
  end
end
