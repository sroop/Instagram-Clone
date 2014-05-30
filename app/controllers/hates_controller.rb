class HatesController < ApplicationController

	def create
		@hate = Hate.find(params[:post_id])
	end
end
