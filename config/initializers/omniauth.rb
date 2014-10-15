Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.production?
    provider :github, '255ac5a8289abdc15793', '991a8dd5d6e4f4ef89e9f958021ea4294677fc5c'
  elsif Rails.env.development?
    provider :github, '255ac5a8289abdc15793', '991a8dd5d6e4f4ef89e9f958021ea4294677fc5c'
  end
  OmniAuth.config.logger = Rails.logger
end
