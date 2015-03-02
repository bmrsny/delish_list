require "rails_helper"

feature "static pages" do
	scenario "User can visit the about page" do
		visit "/"
		click_link "About"
		expect(current_path).to eq(about_path)
	end
end
