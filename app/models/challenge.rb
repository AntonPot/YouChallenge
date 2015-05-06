class Challenge < ActiveRecord::Base
	belongs_to :proposer, class_name: "User", foreign_key: "proposer_id"
	belongs_to :victim, class_name: "User", foreign_key: "victim_id"
end
