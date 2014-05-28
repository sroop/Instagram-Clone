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

	context 'Lots of posts from multiple users' do
		
		before do
			sroop = User.create(email: 'sroop@sunar.com', password: '123456789', password_confirmation: '123456789')
			nico = User.create(email: 'nico@sunar.com', password: '123456789', password_confirmation: '123456789')
			login_as sroop
		end

		it 'a post can be deleted' do
			visit '/posts'
			add_post("Leaf", "Look at this leaf")
			click_on 'Delete'
			expect(current_path).to eq('/posts')
			expect(page).to_not have_content("Leaf")
		end

	end

end