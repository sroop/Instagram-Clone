class HatesController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@hate = Hate.new
		@post.hates << @hate
		# @hate = Hate.new(post: @post)  -this line also adds a post id to a hate, like the above two lines
		@hate.user = current_user
		@hate.save
		redirect_to '/posts'
	end

end
