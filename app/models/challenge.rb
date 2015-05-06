class Challenge < ActiveRecord::Base

	has_many :comments
	has_many :supporters

	# belongs_to :user

	belongs_to :proposer, class_name: "User", foreign_key: "proposer_id"
	belongs_to :victim, class_name: "User", foreign_key: "victim_id"

end
