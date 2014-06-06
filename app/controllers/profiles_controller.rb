class ProfilesController < ApplicationController

	def show
		@user = Post.find(params[:post_id]).user
		@posts = @user.posts
		@comment = Comment.new
	end
end
