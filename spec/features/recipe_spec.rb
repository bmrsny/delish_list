require "rails_helper"

feature "recipe index page" do
	scenario "User can visit a recipes listing page" do
	Recipe.create(recipe_attributes)

	visit recipes_path
	expect(page).to have_content("Egg Salad")
	end
end
