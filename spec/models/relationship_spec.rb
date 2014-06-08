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

  	it 'should respond to follower' do
  		@relationship.save
  		expect(@relationship).to respond_to(:follower)
  	end

  	it 'should respond to followed' do
  		@relationship.save
  		expect(@relationship).to respond_to(:followed)
  	end

  	it 'should have the right follower' do
  		@relationship.save
  		expect(@relationship.follower).to eq(@follower)
  	end

  	it 'should have the right following' do
  		expect(@relationship.followed).to eq(@followed)
  	end

	context 'validations' do

	  	it "should require a follower_id" do
	      @relationship.follower_id = nil
	      expect(@relationship).to_not be_valid
	    end

	    it "should require a followed_id" do
	      @relationship.followed_id = nil
	      expect(@relationship).to_not be_valid
	    end

	end

end
