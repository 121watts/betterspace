Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.production?
    provider :github, 'a19dcd4c1b219ad2f665', '3f7326c8219be08c868c45b0cae5210500af40b8'
  else
    provider :github, 'a19dcd4c1b219ad2f665', '3f7326c8219be08c868c45b0cae5210500af40b8'
  end
  OmniAuth.config.logger = Rails.logger
end
