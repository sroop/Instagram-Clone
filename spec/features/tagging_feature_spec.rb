require 'spec_helper'

describe 'Tags' do

	context 'Displaying tags on the home page' do

		before do
			user = User.create(email: 'sroop@sunar.com', password: '123456789', password_confirmation: '123456789')
			login_as user
		end

		it 'A tag is displayed' do
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

end