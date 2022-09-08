# frozen_string_literal: true

# User mailer class
class UserMailer < ApplicationMailer
  def new_user
    @user = params[:user]
    @password = params[:password]

    mail(to: @user.email, subject: 'Welcome to the School Management System')
  end
end
