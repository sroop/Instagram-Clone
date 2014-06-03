json.post_id @post.id
json.hate_count pluralize(@post.hates.count, 'hate')
json.hate_id @hate.id