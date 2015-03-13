require "rails_helper"

feature "User Login" do 
	before(:each) do
		@user = User.create(provider: "twitter", 
											  uid: "12345456")
		allow_any_instance_of(ApplicationController).to receive(:current_user)
			.and_return(@user)
	end
	scenario "User can login with Twitter" do 
		@shopping_list = ShoppingList.create(shopping_list_attributes)
		visit shopping_list_path(@shopping_list)
		expect(current_path).to eq(shopping_list_path(@shopping_list))
	end
end
