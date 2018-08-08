class Api::ApplicationController < ApplicationController
  rescue_from StandardError, with: :standard_error
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

  skip_before_action :verify_authenticity_token

  def not_found
    render(
      status: 404,
      json: { 
        status: 404, 
        errors: [{
        type: "NotFound"
        }] 
      }
    )
  end

  private
  def authenticate_user!
    unless current_user.present?
      render(json: { status: 401 } )
    end
  end

  def record_not_found(error)
    # binding.pry
    # This will pause your program when it encounters the line above.
    # It will open a "pry" session at this location allowing you to 
    # look at and use all the variables in scope.
    # Requires the gem 'pry'
    render(
      status: 404,
      json: {
        status: 404,
        errors: [{
          type: error.class.to_s,
          message: error.message
        }]
      }
    )
  end
  # this will catch almost every other error
  def standard_error(error)
    # this sends the error to the logger to be displayed
    logger.error error.full_message

    render(
      status: 500,
      json: {
        status: 500,
        errors: [{
          type: error.class.to_s,
          message: error.message
        }]
      }
    )
  end

  def record_invalid(error)
    # binding.pry
    # render json: error 
    record = error.record
    errors = record.errors.map do |field, message|
      {
        type: error.class.to_s,
        record_type: record.class.to_s,
        field: field,
        message: message
      }
    end

    render(
      status: 422, # Unprocessable Entity Status
      json: {
        status: 422,
        errors: errors
      }
    )
  end
end