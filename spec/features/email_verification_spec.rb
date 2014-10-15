require 'rails_helper'

describe 'email verification' do

  context 'as a user who has never registered before' do

    before (:each) do
      first_time_login
    end

    it 'redirects us to email verification page if email is nil' do
      user = User.find_by uid: "1234"
      expect(user.email).to eq nil
      expect(current_path).to eq user_path(user)
      expect(page).to have_content "Verify Your Email"
    end

    it 'can enter an email address' do
      find("input[placeholder='your email']").set "test@test.com"
      click_on "Verify Email"
      expect(current_path).to eq complaints_path
      expect(page).to have_content("Welcome to BetterSpace")
      user = User.find_by email: "test@test.com"
      expect(user.uid).to eq "1234"
    end

  end

  context 'as a returning user' do

    before (:each) do
      add_email_to_omniauth_hash
    end

    it 'redirects us to home when there is an email present' do
      visit root_path
      click_on "Sign in with GitHub"
      expect(current_path).to eq complaints_path
      expect(page).to have_content "Sign Out"
    end

  end

end
