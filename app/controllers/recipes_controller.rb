class RecipesController < ApplicationController
	def index
		@recipes = Recipe.all
	end

	def show
		 @recipe = Recipe.find(params[:id])
		#@recipe = Recipe.fetch_single
	end

end
