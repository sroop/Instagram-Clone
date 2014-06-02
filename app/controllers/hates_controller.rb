class HatesController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@hate = Hate.new
		@post.hates << @hate
		# @hate = Hate.new(post: @post)  -this line also adds a post id to a hate, like the above two lines
		@hate.user = current_user
		@hate.save!
		render 'create', content_type: :json
	end

	def destroy
		@hate = current_user.hates.find_by(post_id: params[:post_id])
		# @hate = current_user.hates.find(params[:id])
		@hate.destroy
	rescue ActiveRecord::RecordNotFound
		flash[:notice] = "Thats not yours to unhate!"
	ensure
		redirect_to '/posts'
	end

end
