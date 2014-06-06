require 'spec_helper'

describe 'User' do
	
	before do
	@sroop = User.create(email: 'sroop@sunar.com', password: '123456789', password_confirmation: '123456789')
	@nico = User.create(email: 'nico@sunar.com', password: '123456789', password_confirmation: '123456789')
	login_as @sroop
	end

	it 'a user can click on a users name and see all of their posts', js: true do
		visit '/posts'
		add_post("One post")
		add_post("Another post")
		expect(page).to have_content("user sroop@sunar.com")
		logout
		login_as @nico
		add_post("nicos post")
		first(:link, 'sroop@sunar.com').click
		expect(page).to_not have_content("nicos post")
		expect(page).to have_content("One post")
	end

end