# frozen_string_literal: true

class ErrorResponse
  def initialize(errors)
    @errors = errors
  end

  def self.not_found(class_name)
    {
      message: "#{class_name} object not found",
      errors: 'not found',
      code: 404
    }
  end

  def self.unprocessable_entity(object)
    object_errors = object.errors
    errors = object_errors.respond_to?(:full_messages) ? object_errors.full_messages : object_errors
    {
      message: "#{object.class.name} not saved",
      errors: errors,
      code: 422
    }
  end

  def self.unauthorized(errors)
    {
      message: 'Request not processed',
      errors: errors,
      code: 401
    }
  end

  def self.bad_request(errors)
    {
      message: 'Request not processed',
      errors: errors,
      code: 400
    }
  end

  def self.routing_error(errors)
    {
      message: 'Routing error',
      errors: errors,
      code: 404
    }
  end
end
