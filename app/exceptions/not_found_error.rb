# frozen_string_literal: true

# will be raised when a record is not found
class NotFoundError < ApplicationError
  def initialize(message = 'Not found')
    super(message, :not_found)
  end
end