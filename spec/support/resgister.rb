module Register

  def first_time_login
    visit root_path
    click_on "Sign in with GitHub"
  end

  def add_email_to_omniauth_hash
    visit root_path
    click_on "Sign in with GitHub"
    User.update_all(email: "test@test.com")
  end

end
