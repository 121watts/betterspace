require 'rails_helper'

describe ApiKey do
  it 'can belong to a user' do
    user = User.new
    user.api_keys << ApiKey.new
    user.api_keys << ApiKey.new
    user.save
    expect(user.api_keys.count).to eq 2
  end
end
