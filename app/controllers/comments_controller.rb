class CommentsController < ApplicationController
	def create
		new_comment = Comment.new
		new_comment.user_id = current_user.id
		new_comment.challenge_id = params["challenge_id"]
		new_comment.text = params["comment"]["text"]
		new_comment.save
		redirect_to :root
	end
end
