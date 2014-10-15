require 'rails_helper'
include Register

describe "Logging in with OmniAuth" do

  before(:each) do
    add_email_to_omniauth_hash
  end

  it 'can sign in with omniauth' do
    visit root_path
    click_on "Sign in with GitHub"
    expect(current_path).to eq complaints_path
    expect(page).to_not have_content "Sign in"
    expect(page).to     have_content "Sign Out"
   end

  it 'can sign out' do
    visit root_path
    click_on "Sign in with GitHub"
    expect(current_path).to eq complaints_path
    click_on "Sign Out"
    expect(current_path).to eq '/login'
    expect(page).to have_content "Logged out!"
  end

end
