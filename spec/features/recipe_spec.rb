require "rails_helper"

feature "recipe index page" do
	scenario "User can visit a recipes listing page" do
		Recipe.create(recipe_attributes)

		visit recipes_path
		expect(page).to have_content("Egg Salad")
		expect(page).to have_link("View Ingredients")
	end
end
feature "recipe show page" do
	scenario "User can see recipes information" do
		recipe = Recipe.create(recipe_attributes)

		visit recipes_path
		click_link "View Ingredients"
		expect(current_path).to eq("/recipes/2") 
		expect(page).to have_content(recipe.title)
		expect(page).to have_button("Add to Shopping List")
	end
end
