def add_post(caption)
	click_on "Create a post"
	within('#createModal') {
	attach_file 'Picture', Rails.root.join('public/images/image.jpg')
	fill_in "Caption", with: caption 
	fill_in "Address", with: "25 City Road, London"
	click_on "Create" }
end

def add_comment(comment)
	# click_on "Leave a comment"
	fill_in "Comment", with: comment
	click_on "Add"
end