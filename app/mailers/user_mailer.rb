class UserMailer < ApplicationMailer
  default from: 'administrateur@musicDetective.com'

  def welcome_email(user)
    @user = user
    @url  = ['http://example.com/login']
    mail(to: @user.email, subject: ['Bienvenue sur musicDetective'])
  end
end
