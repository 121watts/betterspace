class UserMailer < ActionMailer::Base
  default from: "betterspacenyc@gmail.com"

  def welcome_email(current_user)
    @user = current_user
    @url  = '198.199.83.225'
    mail(to: @user.email, subject: 'Welcome to BetterSpace')
  end

  def contact_us(current_user)
    @user = current_user
    @url  = '198.199.83.225'
    mail(to: @user.email, subject: 'Thank you for contacting us!')
  end
end
