class UsersController < ApplicationController
	def show
		@user = User.find(params[:id]) #new user variable.Based on user id displays information from db in the view
		@rooms = @user.rooms	
	end
end