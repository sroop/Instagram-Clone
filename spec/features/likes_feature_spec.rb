require 'spec_helper'

describe 'Likes' do

	before do
		sroop = User.create(email: 'sroop@sunar.com', password: '123456789', password_confirmation: '123456789')
		@nico = User.create(email: 'nico@sunar.com', password: '123456789', password_confirmation: '123456789')
		login_as sroop
	end
		
	it 'a user can like a post if logged in' do
		visit '/posts'
		add_post("Look at this leaf")
		click_on 'Like'
		expect(page).to have_content("sroop@sunar.com likes this")
	end

	it 'a user can not like a post when logged out' do
		visit '/posts'
		add_post("Look at this leaf")
		logout
		visit '/posts'
		expect(current_path).to eq('/posts')
		expect(page).to have_content("Look at this leaf")
	end

	it 'a user can only like one specific post once' do
		visit '/posts'
		add_post("Look at this leaf")
		click_on 'Like'
		expect(page).to have_content("sroop@sunar.com likes this")
		click_on 'Like'
		expect(page).to_not have_content("sroop@sunar.com likes this sroop@sunar.com likes this")
	end

end