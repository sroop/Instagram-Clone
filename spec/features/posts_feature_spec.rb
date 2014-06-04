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
			add_post("Saw a flower this morning")
			expect(current_path).to eq('/posts')
			expect(page).to have_content("Saw a flower this morning")
			expect(page).to have_css('img.uploaded-pic')
		end

	end

	context 'Lots of posts from multiple users' do
		
		before do
			sroop = User.create(email: 'sroop@sunar.com', password: '123456789', password_confirmation: '123456789')
			@nico = User.create(email: 'nico@sunar.com', password: '123456789', password_confirmation: '123456789')
			login_as sroop
		end

		it 'a post can be deleted' do
			visit '/posts'
			add_post("Look at this leaf")
			click_on 'Delete'
			expect(current_path).to eq('/posts')
			expect(page).to_not have_content("Look at this leaf")
		end

		it 'a post can only be deleted by the user who created the post' do
			visit '/posts'
			add_post("Look at this leaf")
			logout
			login_as @nico
			click_on 'Delete'
			expect(current_path).to eq('/posts')
			expect(page).to have_content("Look at this leaf")
			expect(page).to have_css('img.uploaded-pic')
		end

	end

	context 'Geo-coding' do

		before do
			sroop = User.create(email: 'sroop@sunar.com', password: '123456789', password_confirmation: '123456789')
			login_as sroop
		end

		it 'a post has a link to a map if an address is input' do
			visit '/posts'
			click_on "Create a post"
			attach_file 'Picture', Rails.root.join('public/images/image.jpg')
			fill_in "Caption", with: "nice picture"
			fill_in "Address", with: "25 City Road, London"
			click_on "Add"
			expect(current_path).to eq('/posts')
			expect(page).to have_link('Map')
		end

		it 'a post does not have a map link if an address is not input' do
			visit '/posts'
			click_on "Create a post"
			attach_file 'Picture', Rails.root.join('public/images/image.jpg')
			fill_in "Caption", with: "nice picture"
			click_on "Add"
			expect(current_path).to eq('/posts')
			expect(page).to_not have_link('Map')
		end

		it 'a map link leads to a page with the map' do
			visit '/posts'
			add_post("cool caption")
			expect(page).to have_link('Map')
			click_on 'Map'
			expect(page).to_not have_content('Map')
		end


	end

end


















