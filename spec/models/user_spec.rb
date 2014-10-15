require 'rails_helper'

describe User do

  it { should validate_uniqueness_of(:uid) }

  it { should allow_value("email@addresse.foo").for(:email) }

end
