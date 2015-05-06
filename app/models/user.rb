class User < ActiveRecord::Base

  has_many :challenges

  has_many :proposer_challenges, class_name: "Challenge", foreign_key: "victim_id"
  has_many :proposers, class_name: "User", through: :proposer_challenges

  has_many :victim_challenges, class_name: "Challenge", foreign_key: "proposer_id"
  has_many :victims, class_name: "User", through: :victim_challenges

end
