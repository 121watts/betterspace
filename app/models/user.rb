class User < ActiveRecord::Base
  validates_uniqueness_of :uid, :name
  has_many :api_keys

  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    user = User.new
    user.provider = auth["provider"]
    user.uid = auth["uid"]
    user.image_url = auth["info"]["image"]
    user.name = auth["info"]["name"]
    user.save
    user
  end

  def first_name
    name.split[0]
  end
end
