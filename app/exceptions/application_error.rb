# frozen_string_literal: true

class ApplicationError < StandardError
  attr_reader :message, :status

  def initialize(message, status = :internal_server_error)
    super(message, status)
    @message = message
    @status = status
  end
end

class RecordNotFound < ApplicationError
  def initialize(message = 'Record not found')
    super(message, :not_found)
  end
end

class InvalidRequest < ApplicationError
  def initialize(message = 'Invalid request')
    super(message, :bad_request)
  end
end

class InvalidParameter < ApplicationError
  def initialize(message = 'Invalid parameter')
    super(message, :bad_request)
  end
end

class InvalidCredentials < ApplicationError
  def initialize(message = 'Invalid credentials')
    super(message, :unauthorized)
  end
end

class InvalidToken < ApplicationError
  def initialize(message = 'Invalid token')
    super(message, :unauthorized)
  end
end

class InvalidRefreshToken < ApplicationError
  def initialize(message = 'Invalid refresh token')
    super(message, :unauthorized)
  end
end

class ExpiredToken < ApplicationError
  def initialize(message = 'Expired token')
    super(message, :unauthorized)
  end
end

class ExpiredRefreshToken < ApplicationError
  def initialize(message = 'Expired refresh token')
    super(message, :unauthorized)
  end
end

class InvalidRole < ApplicationError
  def initialize(message = 'Invalid role')
    super(message, :unauthorized)
  end
end

class InvalidScope < ApplicationError
  def initialize(message = 'Invalid scope')
    super(message, :unauthorized)
  end
end

class InvalidGrantType < ApplicationError
  def initialize(message = 'Invalid grant type')
    super(message, :unauthorized)
  end
end

class InvalidClient < ApplicationError
  def initialize(message = 'Invalid client')
    super(message, :unauthorized)
  end
end

class InvalidClientSecret < ApplicationError
  def initialize(message = 'Invalid client secret')
    super(message, :unauthorized)
  end
end
