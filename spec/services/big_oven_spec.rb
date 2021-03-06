require 'rails_helper'

RSpec.describe Fetcher, :type => :model do
	describe "RecipeSearch" do
		context "search input" do
			VCR.use_cassette("search") do
				
				search = Fetcher.new.search_input("brownies")

				it "returns recipes when given brownies" do 
					expect(search["RecipeSearchResult"]["Results"]["RecipeInfo"].count).to eq(40)
				end

				it "returns a filtered down list to Recipe Info" do
					expect(search["RecipeSearchResult"]["Results"]["RecipeInfo"].first["Title"]).to eq("Brownies")	
				end
			end
		end

		context "search_by_keyword" do
			VCR.use_cassette("search_by_keyword") do
				search_by_keyword = Fetcher.new.search_by_keyword("cupcakes")

				it "returns a an array of cupcakes" do
					expect(search_by_keyword.count).to eq(40)
				end

				it "reutrns a cupcake title" do
					expect(search_by_keyword.first["Title"]).to eq("Cupcakes")
				end
			end
		end

		context "search_by_keyword_incorrect_keyword" do
			VCR.use_cassette("search_by_incorrect_keyword") do
				search_by_incorrect_keyword = Fetcher.new.search_by_keyword("Goonies")

				it "returns an error when searching incorrect keyword " do
					expect(search_by_incorrect_keyword).to eq(false)
				end
			end
		end
		
		context "search_by_keyword_incorrect_keyword" do
			VCR.use_cassette("fetch_single_recipe") do
				single_recipe = Fetcher.new.fetch_single("100")

				it "returns a single recipe" do
					expect(single_recipe["RecipeID"]).to eq("100")
				end

				it "returns a single recipe title" do
					expect(single_recipe["Title"]).to eq("Killer Bread")
				end
			end
		end

		context "get ingredients from recipe id" do
			VCR.use_cassette("fetch_ingredients") do
				ingredients = Fetcher.new.fetch_ingredients("100")

				it "returns a recipes ingredients" do
					expect(ingredients.count).to eq(7)
				end

				it "returns an ingredient name from recipe id" do
					expect(ingredients.first["Name"]).to eq("Mayonnaise")
				end
			end
		end

		context "get ingredients from recipe id" do
			VCR.use_cassette("search_response") do
				response = Fetcher.new.search_response("muffins")

				it "returns a response from a keyword" do
					expect(response.count).to eq(40)
				end
			end
		end
	end
end
