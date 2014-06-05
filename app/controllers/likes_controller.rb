class LikesController < ApplicationController
	before_action :authenticate_user!

	def index
		@likes = Like.all
	end

	def create
		@post = Post.find(params[:post_id])
		@like = @post.likes.new
		@like.user = current_user
		@like.save!
	rescue ActiveRecord::RecordInvalid
		render json: { error: 'Cannot like' }, status: 422
	ensure
		WebsocketRails[:likes].trigger 'new-like', { like_count: @post.likes.count, post_id: @post.id}
		redirect_to '/posts'
	end

	def destroy
		@like = current_user.likes.find_by(post_id: params[:post_id])
		@post = Post.find(params[:post_id])
		@like.destroy! if @like
	rescue ActiveRecord::RecordNotFound
		flash[:notice] = "Thats not yours to unlike!"
	ensure
		WebsocketRails[:likes].trigger 'deleted-like', { like_count: @post.likes.count, post_id: @post.id}
		redirect_to '/posts'
	end

end