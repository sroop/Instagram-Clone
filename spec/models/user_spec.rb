require 'spec_helper'

describe "relationships" do

 	before do
		@follower = User.create(email: 'sroop@sunar.com', password: '123456789', password_confirmation: '123456789')
		@followed = User.create(email: 'nico@sunar.com', password: '123456789', password_confirmation: '123456789')
	end

    it "should have a relationships method" do
      @follower.should respond_to(:relationships)
    end
  
end
