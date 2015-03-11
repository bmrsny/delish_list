class RecipesController < ApplicationController
	def index
		if Fetcher.new.search_by_keyword(params[:search]) == false
			flash[:error] = "#{params[:search]} is not a valid search term."
			redirect_to root_path
		else
		Fetcher.new.create_or_find_recipes(params[:search])
			#@recipes = Recipe.all.last(20)
			@recipes = Recipe.order("created_at desc").limit(20)
		end
	end

	def show
		@shopping_list = ShoppingList.new
		 @recipe = Recipe.find(params[:id])
		 session[:last_page] = "/recipes/#{@recipe.id}"
		 if current_user
		 	@shopping_lists = current_user.shopping_lists
		 end
	end
end
