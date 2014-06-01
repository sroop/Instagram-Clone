class PostsController < ApplicationController

	before_action :authenticate_user!, except: [:index]
	
	def index
		@posts = Post.all
		@comment = Comment.new
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(params[:post].permit(:picture, :caption, :tag_name))
		@post.user = current_user
		@post.save
		redirect_to('/posts')
	end

	def destroy
		@post = current_user.posts.find(params[:id])
		@post.destroy
	rescue ActiveRecord::RecordNotFound
		flash[:notice] = "Can't delete!"
	ensure
		redirect_to '/posts'
	end

end
