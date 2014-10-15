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

    it 'should redirect to login if not logged in' do
      click_on "Sign in"
      expect(current_path).to eq login_path
    end
  end

  context "as a verified user" do

    before(:each) do
      visit root_path
      click_on "Sign in with GitHub"
    end

    it 'should see your name when logged in' do
      expect(page).to have_content("Example User")
    end

    it 'should be able to click on link developer' do
      click_on "Developer"
      expect(current_path).to eq api_keys_path
    end

    it 'should see your first name on the develeoper page' do
      click_on "Developer"
      expect(current_path).to eq api_keys_path
      expect(page.find('h1')).to have_content "Example"
    end

  end
end
