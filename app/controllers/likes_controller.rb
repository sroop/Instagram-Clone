class LikesController < ApplicationController
	before_action :authenticate_user!

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
		# WebsocketRails[:likes].trigger 'new', { new_like_count: @post.likes.count, post_id: @post_id }
		render 'create', content_type: :json
	rescue ActiveRecord::RecordInvalid
		render json: { error: 'Cannot like' }, status: 422
	end

	def destroy
		@like = current_user.likes.find_by(post_id: params[:post_id])
		@post = Post.find(params[:post_id])
		# @like = Like.find(params[:id])
		@like.destroy! if @like
	rescue ActiveRecord::RecordNotFound
		flash[:notice] = "Thats not yours to unlike!"
	ensure
		# redirect_to '/posts'
		render 'destroy', content_type: :json
	end

end