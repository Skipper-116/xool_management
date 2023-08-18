# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@schoolsystem.com'
  layout 'mailer'
end
