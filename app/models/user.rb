class User < ActiveRecord::Base

  # has_many :challenges
  has_many :comments
  has_many :supporters

  has_many :is_victim, class_name: "Challenge", foreign_key: "victim_id"
  has_many :proposers, class_name: "User", through: :is_victim

  has_many :has_proposed, class_name: "Challenge", foreign_key: "proposer_id"
  has_many :victims, class_name: "User", through: :has_proposed


  def self.from_omniauth(auth)
  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.username = auth.info.nickname
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.image = auth.info.image
      user.location = auth.info.location
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

end
