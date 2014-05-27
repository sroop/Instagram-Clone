require 'spec_helper'

describe 'Instagram Posts' do


	
	context 'Day 1 of the site' do

		before do
			user = User.create(email: 'sroop@sunar.com', password: '123456789', password_confirmation: '123456789')
			login_as user
		end
		
		it 'Home page has no posts to show' do
			visit '/posts'
			expect(page).to have_content "No posts"
		end

		it 'Home page has the ability to add a post' do
			visit '/posts'
			add_post("Flower", "Saw a flower this morning")
			expect(current_path).to eq('/posts')
			expect(page).to have_content("Saw a flower this morning")
		end

	end

end