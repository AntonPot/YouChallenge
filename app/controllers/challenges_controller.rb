class ChallengesController < ApplicationController
	
	def index
		@challenges = Challenge.all
		@new_challenge = Challenge.new
		current_user 
		# p "GOTCHA" * 10
		p @current_user

	end

	def create
		current_user
		newchallenge = Challenge.create(	title: params["challenge"]["title"], 
												  	description: params["challenge"]["description"], 
												  	proposer_id: @current_user.id )
		redirect_to :root
	end
	
end
