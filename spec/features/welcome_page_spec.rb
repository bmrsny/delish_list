require "rails_helper"

feature "landing page" do
	scenario "user can visit the landing page" do
		visit "/"
		expect(current_path).to eq(root_path)
	end

	scenario "user can see a link to about page" do
		visit "/"
		expect(page).to have_link("About")
	end

	scenario "user can see a footer with links" do
		visit "/"
		expect(page).to have_link("Facebook")
		expect(page).to have_link("Github")
		expect(page).to have_link("Twitter")
	end
end
