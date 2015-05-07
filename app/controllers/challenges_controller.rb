class ChallengesController < ApplicationController
	def index
		@challenges = Challenge.all
		@new_challenge = Challenge.new
		current_user 
		# p "GOTCHA" * 10
		p @current_user

	end

	def create
		p "==================" * 10
		p params
		p "==================" * 10
		current_user
		p @current_user
		p "==================" * 10
		newchallenge = Challenge.create(title: params["challenge"]["title"], description: params["challenge"]["description"], proposer_id: @current_user.id)
		# newchallenge.save
		p "==================" * 10
		p "NEW CHALLENGE"
		p newchallenge
		p "==================" * 10
		# newchallenge.proposer = params.challenge.

		redirect_to :root
	end
	
end
