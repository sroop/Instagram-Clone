class PostsController < ApplicationController
	
	def index
		@posts = Post.all
	end

	def new
		@posts = Post.new
	end

	def create
		Post.create(params[:post].permit(:image, :caption))
		redirect_to('/posts')
	end

end
