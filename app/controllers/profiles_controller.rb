class ProfilesController < ApplicationController

	def show
		@posts = User.find(params[:user_id]).posts
		@comment = Comment.new
	end
end
