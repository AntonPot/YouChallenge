class UsersController < ApplicationController

	private

	def userparams 
		params.require(:user).permit(:provider, :uid, :name, :oauthtoken, :oauthexpiresat) 
	end
end
