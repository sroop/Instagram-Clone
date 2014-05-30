module PostsHelper
	def user_likes?(post)
		!user_like_for(post).nil?
	end

	def user_like_for(post)
		current_user.likes.first{ |l| l.post == post }
	end

	def user_hates?(post)
		!user_hate_for(post).nil?
	end

	def user_hate_for(post)
		current_user.hates.first{ |h| h.post == post }
	end
end
