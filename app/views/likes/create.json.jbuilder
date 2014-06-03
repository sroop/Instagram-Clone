json.email @like.user.email
json.post_id @like.post_id
json.like_count pluralize(@post.likes.count, 'like')
json.id @like.id