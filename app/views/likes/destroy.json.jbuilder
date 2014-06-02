json.post_id @post.id
json.like_count pluralize(@post.likes.count, 'like')