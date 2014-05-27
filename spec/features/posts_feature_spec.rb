require 'spec_helper'

describe 'Instagram Posts' do
	
	context 'Day 1 of the site' do
		
		it 'Home page has no posts to show' do
			visit '/posts'
			expect(page).to have_content "No posts"
		end

		it 'Home page has the ability to add a post' do
			visit '/posts'
			click_on "Create a post"
			expect(current_path).to eq('/posts/new')
			fill_in
			fill_in :tags, with: "Makers, Codeschool"
			click_on "Add"
			expect(current_path).to eq('/posts')
			expect(page).to have_content("Makers, Codeschool")
		end

	end

end