class Contact < MailForm::Base
  attribute :name, validate: true
end
