class ChallengesController < ApplicationController
	def index
		@challenges = Challenge.all
	end

	def create
		p "GOTCHA" * 10
	end
	
end
