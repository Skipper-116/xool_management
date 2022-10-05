# frozen_string_literal: true

# this will be used to handle exceptions
module ExceptionHandler
  extend ActiveSupport::Concern

  def log_exception(exception)
    stack_trace = exception.backtrace.join("\n")
    Rails.logger.error("\n\n\033[1m#{exception.class} - #{exception.message}\033[0m\n#{stack_trace}")
  end

  # rubocop:disable Metrics/BlockLength
  included do
    # rescues are performed in a LIFO manner thus base classes must be
    # declared early.
    rescue_from ApplicationError do |e|
      render json: { errors: [e.message] }, status: e.status
    end

    rescue_from NotFoundError do |e|
      render json: { errors: [e.message] }, status: e.status
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: { errors: [e.message] }, status: :not_found
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end

    rescue_from ActionController::ParameterMissing do |e|
      render json: { errors: [e.message] }, status: :bad_request
    end

    rescue_from ActiveRecord::RecordNotUnique do |e|
      render json: { errors: [e.message] }, status: :conflict
    end

    rescue_from ActiveRecord::InvalidForeignKey do |e|
      render json: { errors: [e.message] }, status: :conflict
    end

    rescue_from ActiveRecord::StatementInvalid do |e|
      render json: { errors: [e.message] }, status: :conflict
    end

    rescue_from ActiveRecord::NotNullViolation do |e|
      render json: { errors: [e.message] }, status: :conflict
    end

    rescue_from ActiveRecord::RecordNotDestroyed do |e|
      render json: { errors: [e.message] }, status: :conflict
    end

    rescue_from ActiveRecord::RecordNotSaved do |e|
      render json: { errors: [e.message] }, status: :conflict
    end

    rescue_from InvalidClient do |e|
      render json: { errors: [e.message] }, status: :unauthorized
    end

    rescue_from InvalidGrantType do |e|
      render json: { errors: [e.message] }, status: :unauthorized
    end

    rescue_from InvalidRequest do |e|
      render json: { errors: [e.message] }, status: :bad_request
    end

    rescue_from InvalidParameter do |e|
      render json: { errors: [e.message] }, status: :bad_request
    end

    rescue_from InvalidCredentials do |e|
      render json: { errors: [e.message] }, status: :unauthorized
    end

    rescue_from InvalidToken do |e|
      render json: { errors: [e.message] }, status: :unauthorized
    end

    rescue_from InvalidRefreshToken do |e|
      render json: { errors: [e.message] }, status: :unauthorized
    end

    rescue_from ExpiredToken do |e|
      render json: { errors: [e.message] }, status: :unauthorized
    end

    rescue_from ExpiredRefreshToken do |e|
      render json: { errors: [e.message] }, status: :unauthorized
    end

    rescue_from JWT::DecodeError do |e|
      render json: { errors: [e.message] }, status: :unauthorized
    end

    rescue_from JWT::ExpiredSignature do |e|
      render json: { errors: [e.message] }, status: :unauthorized
    end

    rescue_from JWT::InvalidIatError do |e|
      render json: { errors: [e.message] }, status: :unauthorized
    end

    rescue_from JWT::InvalidIssuerError do |e|
      render json: { errors: [e.message] }, status: :unauthorized
    end

    rescue_from JWT::InvalidJtiError do |e|
      render json: { errors: [e.message] }, status: :unauthorized
    end

    rescue_from JWT::InvalidSubError do |e|
      render json: { errors: [e.message] }, status: :unauthorized
    end

    rescue_from JWT::InvalidAudError do |e|
      render json: { errors: [e.message] }, status: :unauthorized
    end

    rescue_from JWT::InvalidIatError do |e|
      render json: { errors: [e.message] }, status: :unauthorized
    end

    rescue_from InvalidClientSecret do |e|
      render json: { errors: [e.message] }, status: :unauthorized
    end
  end
  # rubocop:enable Metrics/BlockLength
end
