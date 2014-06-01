class TagsController < ApplicationController

	def show
		@tag = Tag.find_by(name: '#' + params[:id])
		@comment = Comment.new
	end
end
