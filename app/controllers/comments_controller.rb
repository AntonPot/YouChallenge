class CommentsController < ApplicationController
	def create
		p "*"*25
		p params
		p "*"*25
		

		current_user

		new_comment = Comment.new

		new_comment.user_id = current_user.id
		new_comment.challenge_id = params["challenge_id"]
		new_comment.text = params["comment"]["text"]

		new_comment.save

		p "*"*25
		p new_comment
		p "*"*25

		redirect_to :root

	end

end
