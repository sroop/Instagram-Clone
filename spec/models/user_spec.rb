require 'spec_helper'

describe "relationships" do

 	before do
		@follower = User.create(email: 'sroop@sunar.com', password: '123456789', password_confirmation: '123456789')
		@followed = User.create(email: 'nico@sunar.com', password: '123456789', password_confirmation: '123456789')
	end

    it "should have a relationships method" do
      expect(@follower).to respond_to(:relationships)
    end

    it "should have a following method" do
    	expect(@follower.following).to be_true
      # expect(@follower).to respond_to(:following)
    end
  
end
