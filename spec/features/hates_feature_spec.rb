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

	it 'a user can not hate a post when logged out' do
		visit '/posts'
		add_post("Look at this leaf")
		logout
		visit '/posts'
		expect(current_path).to eq('/posts')
		expect(page).to_not have_content("Hate")
	end

	it 'a user can only hate one specific post one time' do
		visit '/posts'
		add_post("Look at this leaf")
		click_on 'Hate'
		expect(page).to have_content("sroop@sunar.com hates this")
		expect(page).to_not have_content("Hate")
	end

	it 'a user can unhate their hate' do
		visit '/posts'
		add_post("Look at this leaf")
		click_on 'Hate'
		expect(page).to have_content("sroop@sunar.com hates this")
		expect(page).to_not have_content("Hate")
		expect(page).to have_content("Unhate")
		click_on 'Unhate'
		expect(page).to_not have_content("sroop@sunar.com hates this")
	end

end