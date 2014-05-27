def add_post(image, caption)
	click_on "Create a post"
	expect(current_path).to eq('/posts/new')
	fill_in "Image", with: image
	fill_in "Caption", with: caption 
	click_on "Add"
end