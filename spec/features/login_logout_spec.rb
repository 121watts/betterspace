require 'rails_helper'

describe "Logging in with OmniAuth" do

  it 'can sign in with omniauth' do
    visit '/'
    click_on "Sign in with GitHub"
    expect(page).to_not have_content "Sign in"
    expect(page).to     have_content "Sign Out"
   end

  #resque_mailer
  it 'can sign out' do

  end

end
