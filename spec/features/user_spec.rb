require 'rails_helper'

describe "user experience" do
  context "as a guest" do
    before(:each) do
      visit complaints_path
    end

    it "should see login option if not signed in" do
      expect(page).to have_content "Sign in"
    end

    it "should not see developer and sign out options" do
      expect(page).to_not have_content "Developer"
      expect(page).to_not have_content "Sign Out"
    end

    it "should still be able to search for complaints" do
      fill_in "search_address", with: "New York, NY"
      click_on "Search"
      expect(current_path).to eq complaints_path
    end

    it "should be able to click on find me link" do
      click_on "find me"
      expect(current_path).to eq complaints_path
    end

    it "should be able to click on contact us link" do
      click_on "Contact"
      expect(current_path).to eq contacts_path
    end

    it "should be able to send a contact form successfully" do
      click_on "Contact"
      expect(current_path).to eq contacts_path
      fill_in "Name", with: "Watts"
      fill_in "Email", with: "yourmom123@aol.com"
      fill_in "Message", with: "This is a test"
      page.find('.btn-primary').click
      expect(current_path).to eq complaints_path
      expect(page).to have_content "Thank you for your message!"
    end
  end
end
