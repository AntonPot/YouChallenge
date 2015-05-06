class User < ActiveRecord::Base

  # has_many :challenges
  has_many :comments
  has_many :supporters

  has_many :is_victim, class_name: "Challenge", foreign_key: "victim_id"
  has_many :proposers, class_name: "User", through: :is_victim

  has_many :has_proposed, class_name: "Challenge", foreign_key: "proposer_id"
  has_many :victims, class_name: "User", through: :has_proposed

end
