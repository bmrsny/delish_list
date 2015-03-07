class ShoppingListController < ApplicationController
	before_filter :authorize

	def index
		 @recipe = Recipe.find(params[:id])
	end

	def show
		@shopping_list = ShoppingList.find(params[:id])
	end

	private

	def authorize
		if current_user.nil?
			redirect_to root_path
			flash[:alert] = "You are not authorized to visit this page"
		end
	end
end
