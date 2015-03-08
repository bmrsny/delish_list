class ShoppingListController < ApplicationController
	before_filter :authorize

	def index
		 @recipe = Recipe.find(params[:id])
	end

	def show
		@shopping_list = ShoppingList.find(params[:id])
	end

	def update 
	@shopping_list = ShoppingList.find(params[:shopping_list][:shopping_list_id])
	redirect_to shopping_list_path(@shopping_list)
	end

	private

	def authorize
		if current_user.nil?
			redirect_to root_path
			flash[:alert] = "You are not authorized to visit this page"
		end
	end
end
