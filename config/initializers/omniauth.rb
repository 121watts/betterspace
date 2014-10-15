Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_CLIENT_LOCAL'], ENV['GITHUB_KEY_LOCAL']
  OmniAuth.config.logger = Rails.logger
end
  
