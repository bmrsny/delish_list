require "rails_helper"

feature "User can add ingredients to old shopping list" do
	before(:each) do
		@user = User.create(provider: "twitter",
											 	name: "Bruce Wayne", 
											 	uid: "1234545")
		allow_any_instance_of(ApplicationController).to receive(:current_user)
			.and_return(@user)
			
		@recipe = Recipe.create(title: "Egg Noodles", 
													 description: "Yummy noodles", 
													 category: "Healthy", 
													 subcategory: "cusine", 
													 instructions: "throw it in a pan and cook for 12 hours")
		@ingredient = @recipe.ingredients.create(name: "garlic", unit: "oz", quantity: "12")
	end

	scenario "User can add ingredients to a old shopping list" do
		visit recipe_path(@recipe)
		expect(page).to have_content(@ingredient.name)
		click_link_or_button "Add Ingredients to Shopping List"
		within(".shopping-list-modal") do
			click_link_or_button "Thanksgiving"
		end
		expect(current_path).to eq(shopping_list_path(@shopping_llist))
	end
end
