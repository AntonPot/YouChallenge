class UsersController < ApplicationController

	private

	def userpbiarams 
		params.require(:user).permit(:provider, :uid, :name, :oauthtoken, :oauthexpiresat) 
	end
	
end
