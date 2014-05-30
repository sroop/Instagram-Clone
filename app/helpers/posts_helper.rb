module PostsHelper
	def user_likes?(post)
		!user_like_for(post).nil?
	end

	def user_like_for(post)
		current_user.likes.first{ |l| l.post == post }
	end
end
