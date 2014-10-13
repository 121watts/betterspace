require 'rails_helper'

describe 'contact form' do
  before(:each) do
    visit contacts_path
  end

  it "should be able to send a contact form successfully" do
    click_on "Contact"
    expect(current_path).to eq contacts_path
    find("input[placeholder='name']").set "watts"
    find("input[placeholder='email']").set "yourmom123@aol.com"
    find("textarea[placeholder='your message']").set "watts"
    page.find('.btn-primary').click
    expect(current_path).to eq complaints_path
    expect(page).to have_content "Thank you for your message!"
  end
end
