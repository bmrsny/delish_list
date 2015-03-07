class RecipesController < ApplicationController
	def index
		@recipes = Recipe.all
	end

	def show
		 @recipe = Recipe.find(params[:id])
		 if current_user.present?
		 	@shopping_lists = current_user.shopping_lists
		 end
		#@recipe = Recipe.fetch_single
	end

end
