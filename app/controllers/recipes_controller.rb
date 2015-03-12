class RecipesController < ApplicationController
	def index
		if Recipe.search(params[:search]) == false
			flash[:alert] = "#{params[:search]} is not a valid search term."
			redirect_to root_path
		else
			@recipes = Recipe.search(params[:search])
		end
	end

	def show
		@shopping_list = ShoppingList.new
		 @recipe = Recipe.single_recipe(params[:id])
			session[:last_page] = request.referer
		if current_user
		 	@shopping_lists = current_user.shopping_lists
		 end
	end
end
