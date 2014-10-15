class WelcomeEmail
  @queue = :welcome_email

  def self.perform(current_user)
    UserMailer.welcome_email(current_user).deliver
  end
end
