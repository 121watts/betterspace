require 'rails_helper'

describe 'has a versioned api', :type => :request do

  it 'can see all of the complaints' do
    5.times { Complaint.create }
    get 'api/v1/complaints'
    json = JSON.parse(response.body)
    expect(json.count).to eq 5
  end

  it 'cannot see a specific complaint without a token' do
    Complaint.create(id: 1, address: "12346 Awesome Pl")
    get 'api/v1/complaints/1'
    expect(response.code).to eq '401'
  end

end
