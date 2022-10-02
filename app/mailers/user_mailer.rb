# frozen_string_literal: true

# User mailer class
class UserMailer < ApplicationMailer
  def new_user
    params.compact! each do |param|
      @user = param[:user]
      @password = param[:password]

      mail(to: @user.person.email, subject: 'Welcome to the School Management System')
    end
  end
end
