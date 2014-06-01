module PostsHelper
	def user_likes?(post)
		!user_like_for(post).nil?
	end

	def user_like_for(post)
		current_user.likes.select{ |l| l.post == post }.first
	end

	def user_hates?(post)
		!user_hate_for(post).nil?
	end

	def user_hate_for(post)
		current_user.hates.select{ |h| h.post == post }.first
	end
end
