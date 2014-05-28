require 'spec_helper'

describe 'Likes' do

	before do
		sroop = User.create(email: 'sroop@sunar.com', password: '123456789', password_confirmation: '123456789')
		@nico = User.create(email: 'nico@sunar.com', password: '123456789', password_confirmation: '123456789')
		login_as sroop
	end
		
	it 'a user can like a post' do
		visit '/posts'
		add_post("Look at this leaf")
		click_on 'Like'
		expect(page).to have_content("sroop@sunar.com likes this")
	end

end