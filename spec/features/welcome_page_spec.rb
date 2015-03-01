require "rails_helper"

feature "landing page" do
	scenario "user can visit the landing page" do
		visit "/"
		expect(current_path).to eq(root_path)
	end

	scenario "user can see login button " do
		visit "/"
		expect(page).to have_button("Sign In")
	end
end
