require 'rails_helper'

RSpec.describe User, :type => :model do
	it { should have_many(:shopping_lists) }

	it "should return a user object after twitter login" do 
		obj = User
		obj.stub(:find_or_create_by)
	end

	it "should return a user object" do 
		obj = User
		obj.stub(:find_or_create_from_auth)
	end

end
