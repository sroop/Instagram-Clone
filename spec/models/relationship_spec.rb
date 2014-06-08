require 'spec_helper'

describe Relationship do
  	before do
		@follower = User.create(email: 'sroop@sunar.com', password: '123456789', password_confirmation: '123456789')
		@followed = User.create(email: 'nico@sunar.com', password: '123456789', password_confirmation: '123456789')
		@relationship = @follower.relationships.new(:followed_id => @followed.id)
	end

	it "should create a new instance given valid attributes" do
    	@relationship.save!
  	end
end
