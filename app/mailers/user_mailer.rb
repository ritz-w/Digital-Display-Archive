class UserMailer < ApplicationMailer
    default from: "ritz.wu@outlook.com"

  def contact_form(email, name, message)
    mail(:from => email,
          :to => 'ritz.wu@outlook.com',
          :subject => "A new contact form message from #{name}")
  end

  def welcome(user)
    @appname = "No Shop"
    mail(to: user.email, subject: "Welcome to #{@appname}!")
  end

  def payment_confirmation(user, product)
    @user = user
    @product = product
    mail(to: user.email, subject: "Payment Confirmation")
  end

end
