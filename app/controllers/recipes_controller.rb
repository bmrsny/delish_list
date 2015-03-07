class RecipesController < ApplicationController
	#before_filter :set_last_page
	def index
		@recipes = Recipe.all
	end

	def show
		 @recipe = Recipe.find(params[:id])
		 session[:last_page] = "/recipes/#{@recipe.id}"
		 if current_user.present?
		 	@shopping_lists = current_user.shopping_lists
		 end
		#@recipe = Recipe.fetch_single
	end

	private
	
	#def set_last_page
  #  if current_user.nil?
	#		session[:last_page] = request.referer 
	#	end
	#end
end
