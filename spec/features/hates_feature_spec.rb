require 'spec_helper'


describe 'Hates' do

	before do
		sroop = User.create(email: 'sroop@sunar.com', password: '123456789', password_confirmation: '123456789')
		@nico = User.create(email: 'nico@sunar.com', password: '123456789', password_confirmation: '123456789')
		login_as sroop
	end

	it 'a user can hate a post when logged in' do
		visit '/posts'
		add_post("Look at this leaf")
		click_on 'Hate'
		expect(page).to have_content("sroop@sunar.com hates this")
	end

end