class User < ActiveRecord::Base
  validates_uniqueness_of :uid, :name

  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    user = User.new
    user.provider = auth["provider"]
    user.uid = auth["uid"]
    user.name = auth["info"]["nickname"]
    user.image_url = auth["info"]["image"]
    user.save
    user
  end

end