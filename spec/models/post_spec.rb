require 'spec_helper'

	describe '#tag_names=' do

			let!(:post) { Post.create() }

		it 'For a post with no tags' do
			post.tag_name = ""
			expect(post.tags).to be_empty
		end

		it 'For a post with one tag, the post can count one tag' do
			post.tag_name = "nature"
			expect(post.tags.count).to eq(1)
			# expect(post.tags).to eq("#nature")
		end

		it 'For a post with one tag, the tag has a hashtag in front of it' do
			post.tag_name = "nature"
			expect(post.tags.last.name).to eq("#nature")
		end

		it 'For a tag that already has a hash, do not double the hash' do
			post.tag_name = "#nature"
			expect(post.tags.last.name).to eq("#nature")
		end

		it 'For multiple tags, separate each tag at the comma' do
			post.tag_name = "nature, plants"
			expect(post.tags.count).to eq(2)
		end

		it 'For multiple tags of the same name, only keep a record of it once (no duplicates in the database)' do
			post.tag_name = "nature, plants, nature"
			expect(post.tags.count).to eq(2)
		end

		let!(:tag1) { Tag.create(name: '#nature') }
	

		it 'Tags cannot be duplicated in the database' do
			post.tag_name = "nature"
			expect(post.tags.count).to eq(1)
			# testing that the validation uniqueness in tag model works.
		end

		it 'A tag in the database can be reused for other posts' do
			post.tag_name = "nature"
			expect(post.tags.count).to eq(1)
			expect(tag1.posts).to include(post)
		end

	end