require 'rails_helper'

describe 'Generation of ApiKeys' do

  before(:each) do
    visit root_path
    click_on "Sign in with GitHub"
    click_on "Developer"
  end

  it 'should start with no keys' do
    expect(page).to have_content "You don't have any API keys yet"
  end

  it 'can generate a key' do
    expect(page).to have_content "You don't have any API keys yet"
    click_on "Create API Key"
    expect(page).to_not have_content "You don't have any API keys yet"
    expect(page.find'.token')
  end

  it 'can generate multiple keys' do
    expect(page).to have_content "You don't have any API keys yet"
    4.times {click_on "Create API Key"}
    expect(page).to_not have_content "You don't have any API keys yet"
    expect(page).to     have_content "created."
    expect(page).to have_css(".token", count: 4)
  end

  it 'shows the user the time his keys were created' do
    click_on "Create API Key"
    expect(page).to have_content 'less than a minute ago'
  end
end
