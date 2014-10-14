class Contact < MailForm::Base
  attribute :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :nickname,  captcha: true
  attribute :message

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.

  def headers
    {
      :subject => "BetterSpace Contact Form",
      :to => "betterspacenyc@gmail.com",
      :from => "<#{email}>"
    }
  end

end
