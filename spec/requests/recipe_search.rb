require "spec_helper"

describe "RecipeSearch" do 
	it "shows brownie recipes given brownies" do
		VCR.use_cassette "search/brownies" do
			visit root_path
			fill_in "search", with: "brownies"
			click_on "search"
			expect(page).to have_content("brownies")
		end
	end
end
