class User < ActiveRecord::Base

  has_many :challenges

  has_many :proposer_challenges, class_name: "Challenge", foreign_key: "victim_id"
  has_many :proposers, class_name: "User", through: :proposer_challenges

  has_many :victim_challenges, class_name: "Challenge", foreign_key: "proposer_id"
  has_many :victims, class_name: "User", through: :victim_challenges


  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

end
