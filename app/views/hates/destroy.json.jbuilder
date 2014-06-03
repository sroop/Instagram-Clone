json.post_id @post.id
json.hate_count pluralize(@post.hates.count, 'hate')
json.id @hate.id