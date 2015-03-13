require 'rails_helper'

RSpec.describe Recipe, :type => :model do
	describe "RecipeSearch" do
		context "search input" do
			VCR.use_cassette("recipe_search") do
				search = Recipe.search("Brownies")

				it "returns a filtered list of recipe info" do
					expect(search.count).to eq(40)
				end

				it "returns a recipe list that have titles" do
					expect(search.first["Title"]).to eq("Brownies")
				end
			end
		end

		context "search single recipe by id" do
			VCR.use_cassette("single_recipe_by_id") do
				recipe = Recipe.single_recipe("100")

				it "returns a single recipe formatted like an object" do
					expect(recipe.RecipeID).to eq("100")
				end

				it "returns a recipe that has a title" do
					expect(recipe.Title).to eq("Killer Bread")
				end
			end
		end

	context "invalid search" do
			VCR.use_cassette("invalid_recipe_search") do
				invalid_search = Recipe.search("Goonies")

				it "returns fals for invalid search criteria" do
					expect(invalid_search).to eq(false) 
				end
			end
		end


		context "returns a list of ingredients from recipe id" do
			VCR.use_cassette("ingredients_list") do
				list = Recipe.ingredients_list("100")

				it "returns a single recipe formatted like an object" do
					expect(list.first["Name"]).to eq("Mayonnaise")
				end

				it "returns a recipe that has a title" do
					expect(list.first["IngredientID"]).to eq("1044")
				end
			end
		end
	end
end


