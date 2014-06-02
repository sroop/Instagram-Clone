require 'spec_helper'

describe 'Instagram Comments' do

	context 'Commenting on a post' do
	
		before do
			user = User.create(email: 'sroop@sunar.com', password: '123456789', password_confirmation: '123456789')
			login_as user
			Post.create(image: 'Flower', caption: 'Lovely flower')
		end

		it 'Posts begin life with no comments' do
			visit '/posts'
			expect(page).to have_content('0 comments')
		end

		it 'A comment can be added to a post', js: true do
			visit '/posts'
			add_comment("beautiful photo!")
			expect(page).to have_content("beautiful photo!")
			expect(page).to have_content("1 comment")
		end

	end

end