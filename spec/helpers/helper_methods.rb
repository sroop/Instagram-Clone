def add_post(image, caption)
	click_on "Create a post"
	expect(current_path).to eq('/posts/new')
	fill_in "Image", with: image
	fill_in "Caption", with: caption 
	click_on "Add"
end

def add_comment(comment)
	click_on "Leave a comment"
	fill_in "Comment", with: comment
	click_on "Add"
end