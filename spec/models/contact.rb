require 'rails_helper'

describe Contact do

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:email) }

  it { should validate_presence_of(:message) }

  it { should allow_value("email@addresse.foo").for(:email) }

  it { should_not allow_value("foo", '*&^%$#@!$@%$#^&').for(:email) }

end
