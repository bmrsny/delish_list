class RecipesController < ApplicationController
	def index
		@recipes = Recipe.all
	end

	def show
		@shopping_list = ShoppingList.new
		 @recipe = Recipe.find(params[:id])
		 session[:last_page] = "/recipes/#{@recipe.id}"
		 if current_user.present?
		 	@shopping_lists = current_user.shopping_lists
			#@shopping_list.ingredients << @recipe.ingredients
		 end
		#@recipe = Recipe.fetch_single
	end

end
