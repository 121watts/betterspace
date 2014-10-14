class UserMailer < ActionMailer::Base
  default from: "betterspacenyc@gmail.com"

  def welcome_email(current_user)
    @user = current_user
    @url  = 'http://localhost:3000/login'
    mail(to: @user.email, subject: 'Welcome to BetterSpace')
  end

  def contact_us(current_user)
    if Rails.env = "test"
      current_user.email = "noreply@apple.com"
    end
    @user = current_user
    @url  = 'http://localhost:3000/login'
    mail(to: @user.email, subject: 'Thank you for contacting us!')
  end
end
