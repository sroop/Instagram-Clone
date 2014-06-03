require 'spec_helper'

describe 'Tags' do

	context 'Displaying tags on the home page' do

		before do
			@user = User.create(email: 'sroop@sunar.com', password: '123456789', password_confirmation: '123456789')
			login_as @user
		end

		it 'A tag is displayed' do
			login_as @user
			visit '/posts'
			click_on "Create a post"
			expect(current_path).to eq('/posts/new')
			attach_file 'Picture', Rails.root.join('public/images/image.jpg')
			fill_in "Caption", with: "Nice flower"
			fill_in "Tags", with: "nature"
			click_on "Add"
			expect(page).to have_link("#nature")
		end

		it 'For a post with two tags, two tags are displayed' do

		end

		#unit testing in spec/models/post_spec.rb for a more detailed breakdown of the tags behaviour

	end

	context 'Filtering posts by tag' do

		before do
			Post.create(caption: "Another random post", tag_name: "#taggage")
			user = User.create(email: 'sroop@sunar.com', password: '123456789', password_confirmation: '123456789')
			login_as user
		end

		it 'Posts are displayed by chosen tag' do
			visit '/posts'
			click_on "Create a post"
			expect(current_path).to eq('/posts/new')
			attach_file 'Picture', Rails.root.join('public/images/image.jpg')
			fill_in "Caption", with: "Nice flower"
			fill_in "Tags", with: "nature"
			click_on "Add"
			expect(page).to have_link("#nature")
			expect(page).to have_content("Another random post")
			click_on("#nature")
			# expect(page).to have_content("Posts tagged with #nature")
			expect(page).to have_content("Nice flower")
			expect(page).to_not have_content("Another random post")
		end

		it 'Tags have their own URL by name, not id' do
			visit '/posts'
			click_on('#taggage')
			expect(current_path).to eq('/tags/taggage')
		end
	end

end