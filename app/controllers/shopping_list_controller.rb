class ShoppingListController < ApplicationController
	#before_filter :authorize
	
	def index
		 @recipe = Recipe.find(params[:id])
	end

	def show
		@shopping_list = ShoppingList.find(params[:id])
	end
	private

	#def authorize
  #  if current_user.nil?
	#		session[:last_page] = request.referer 
	#	  redirect_to root_url, alert: "Must be logged in."
	#	end
	#end
end
