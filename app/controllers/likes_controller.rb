class LikesController < ApplicationController

	def index
		@likes = Like.all
	end

	def create
		# @post = current_user.posts.find(params[:id])
		@post = Post.find(params[:post_id])
		@like = @post.likes.new
		@like.user = current_user
		@like.save!
		# redirect_to '/posts'
		# render json: @like
		WebsocketRails[:likes].trigger 'new', { new_like_count: @post.likes.count, post_id: @post_id }
		# render 'create', content_type: :json
	end

	def destroy
		@like = current_user.likes.find(params[:id])
		# @like = Like.find(params[:id])
		@like.destroy!
	rescue ActiveRecord::RecordNotFound
		flash[:notice] = "Thats not yours to unlike!"
	ensure
		redirect_to '/posts'
	end

end
