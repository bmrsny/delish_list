class RecipesController < ApplicationController
	def index
		Fetcher.new.create_or_find_recipes(params[:search])
			@recipes = Recipe.all.last(20)
	end

	def show
		@shopping_list = ShoppingList.new
		 @recipe = Recipe.find(params[:id])
		 session[:last_page] = "/recipes/#{@recipe.id}"
		 if current_user.present?
		 	@shopping_lists = current_user.shopping_lists
		 end
	end

	private

	def response_titles
		Fetcher.new.get_recipe_titles_from_search(params[:search])
	end

	def response_urls
		Fetcher.new.get_recipe_urls_from_search(params[:search])
	end
end
