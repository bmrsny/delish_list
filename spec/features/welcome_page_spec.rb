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

	scenario "user can see a link to about page" do
		visit "/"
		expect(page).to have_link("About")
	end

	scenario "user can see a dropdown of categories" do
		visit "/"
		expect(page).to have_content("Categories")
	end

	scenario "user can see a link to all categories" do
		visit "/"
		expect(page).to have_link("Breakfast")
		expect(page).to have_link("Lunch")
		expect(page).to have_link("Appetizers")
		expect(page).to have_link("Dinner")
		expect(page).to have_link("Drinks")
	end
end
