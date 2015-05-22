class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    where(:uid => auth["uid"], :provider => auth["provider"]).first_or_create do |u|
      u.uid = auth["uid"]
      u.provider = auth["provider"]
      u.email = auth["info"]["email"]
    end
  end
end

