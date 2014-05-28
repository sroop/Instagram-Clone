def add_post(caption)
	click_on "Create a post"
	expect(current_path).to eq('/posts/new')
	attach_file 'Picture', Rails.root.join('public/images/image.jpg')
	fill_in "Caption", with: caption 
	click_on "Add"
end

def add_comment(comment)
	click_on "Leave a comment"
	fill_in "Comment", with: comment
	click_on "Add"
end