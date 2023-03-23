class UserMailer < Devise::Mailer
  default from: 'administrateur@musicDetective.com'
  # default template_path: 'user_mailer'
  
  def welcome_email(user)
    @user = user
    @url  = ['http://example.com/login']
    mail(to: @user.email, subject: ['Bienvenue sur musicDetective'])
  end

 def reset_password_instructions(record, token, opts={})
  @token = token
 
    super

  end
# def reset_password_instructions(record, token, opts={})
#   @token = token
#   devise_mail(record, :reset_password_instructions, opts)
# end
end
