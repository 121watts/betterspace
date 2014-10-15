require 'rails_helper'
include Register

describe 'contact form' do
  before(:each) do
    add_email_to_omniauth_hash
    click_on "Contact"
  end

  it "should be able to send a contact form successfully" do
    find("input[placeholder='name']").set "watts"
    find("input[placeholder='email']").set "yourmom123@aol.com"
    find("textarea[placeholder='your message']").set "watts"
    page.find('.btn-primary').click
    expect(current_path).to eq complaints_path
    expect(page).to have_content "Thank you for your message!"
  end

  it "does not deliver a message with a missing email" do
    find("input[placeholder='name']").set "watts"
    find("textarea[placeholder='your message']").set "watts"
    page.find('.btn-primary').click
    expect(current_path).to eq contacts_path
  end

  it "does not deliver a message from spammers" do
    find("input[placeholder='name']").set "watts"
    find("input[placeholder='email']").set "yourmom123@aol.com"
    find("textarea[placeholder='your message']").set "watts"
    fill_in "Nickname", with: "wanna spam some spammertons?"
    page.find('.btn-primary').click
  end
end
