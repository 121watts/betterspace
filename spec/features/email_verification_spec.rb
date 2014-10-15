require 'rails_helper'

describe 'email verification' do

  context 'as a user who has never registered before' do

    before (:each) do
      visit root_path
      click_on "Sign in with GitHub"
      @user = User.find_by uid: "1234"
    end

    it 'redirects us to email verification page if email is nil' do
      expect(@user.email).to eq nil
      expect(current_path).to eq user_path(@user)
      expect(page).to have_content "Verify Your Email"
    end

    it 'can enter an email address' do
      find("input[placeholder='your email']").set "test@test.com"
      save_and_open_page
      click_on "Verify Email"
      expect(current_path).to eq complaints_path
      expect(page).to have_content("Welcome to BetterSpace")
      user = User.find_by email: "test@test.com"
      expect(user.uid).to eq "1234"
    end

  end

  context 'as a returning user' do

    before (:each) do
      #this creates an omniauth test user (which doesn't have an email)
      visit root_path
      click_on "Sign in with GitHub"
      User.update_all(email: "test@test.com")
      @user = User.find_by uid: "1234"
    end

    it 'redirects us to home when there is an email present' do
      visit root_path
      click_on "Sign in with GitHub"
      expect(current_path).to eq complaints_path
      expect(page).to have_content "Sign Out"
    end

  end

end
