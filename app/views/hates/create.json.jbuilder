json.email @hate.user.email
json.post_id @hate.post_id
json.hate_count pluralize(@post.hates.count, 'hate')
json.id @hate.id