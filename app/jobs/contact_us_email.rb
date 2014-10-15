class ContactUsEmail
  @queue = :contact_us_email

  def self.perform(current_user)
    UserMailer.contact_us(current_user).deliver
  end
end
