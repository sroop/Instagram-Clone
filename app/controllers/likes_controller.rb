class LikesController < ApplicationController

	def index
		@likes = Like.all
	end

	def create
		# @post = current_user.posts.find(params[:id])
		@post = Post.find(params[:post_id])
		@like = @post.likes.new
		@like.user = current_user
		@like.save
		redirect_to '/posts'
	end
end
