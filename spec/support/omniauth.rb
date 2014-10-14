module OmniauthMacros
  def mock_auth_hash
    OmniAuth.config.mock_auth[:github] = {
      'provider' => 'github',
      'uid' => '123545',
      'user_info' => {
        'name' => 'mockuser',
        'image_url' => 'mock_user_thumbnail_url', 
        'email' => 'noreply@apple.com'
      }
    }
  end
end
