class SupportersController < ApplicationController

	skip_before_action :verify_authenticity_token

	def create
		new_supporter = Supporter.new
		new_supporter.challenge_id = params["challenge_id"]
		new_supporter.user_id = current_user.id
		new_supporter.save!
		redirect_to :root
	end

end
