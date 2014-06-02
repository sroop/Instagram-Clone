require 'spec_helper'

describe 'Likes' do

	before do
		sroop = User.create(email: 'sroop@sunar.com', password: '123456789', password_confirmation: '123456789')
		@nico = User.create(email: 'nico@sunar.com', password: '123456789', password_confirmation: '123456789')
		login_as sroop
	end
		
	# it 'a user can like a post if logged in', js: true do
	# 	visit '/posts'
	# 	add_post("Look at this leaf")
	# 	click_on 'Like'
	# 	expect(page).to have_content("sroop@sunar.com likes this")
	# end

	# it 'a user can only like one specific post once' do
	# 	visit '/posts'
	# 	add_post("Look at this leaf")
	# 	click_on 'Like'
	# 	expect(page).to have_content("sroop@sunar.com likes this")
	# 	expect(page).to_not have_content("Like")
	# end

	# it 'a user can unlike a liked post', js: true do
	# 	visit '/posts'
	# 	add_post("Look at this leaf")
	# 	click_on 'Like'
	# 	expect(page).to have_content("sroop@sunar.com likes this")
	# 	click_on 'Unlike'
	# 	expect(page).to_not have_content("sroop@sunar.com likes this")
	# end


	# it 'a user cannot unlike a like from another user', js:true do
	# 	visit '/posts'
	# 	add_post("Look at this leaf")
	# 	click_on 'Like'
	# 	expect(page).to have_content("sroop@sunar.com likes this")
	# 	logout
	# 	login_as @nico
	# 	click_on 'Unlike'
	# 	expect(page).to have_content("sroop@sunar.com likes this")
	# 	expect(page).to have_content("Thats not yours to unlike!")
	# end

	it 'a user can like a post and the like counter increases by 1', js:true do
		visit '/posts'
		add_post("Look at this leaf")
		click_on 'Like'
		expect(page).to have_content("sroop@sunar.com likes this")
		expect(page).to have_content("1 like")
	end

end