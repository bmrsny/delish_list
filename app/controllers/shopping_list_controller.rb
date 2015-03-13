class ShoppingListController < ApplicationController
	before_filter :authorize

	def create
		@shopping_list = current_user.shopping_lists.create(name: params[:shopping_list][:name])	
		@shopping_list.bulk_create_ingredients(Recipe.ingredients_list(params[:shopping_list][:recipe_id]))

		redirect_to shopping_list_path(@shopping_list)
	end
	
	def show
			@shopping_list = ShoppingList.find(params[:id])
			@ingredients = @shopping_list.ingredients
	end

	def update 
		@shopping_list = current_user.shopping_lists.find(params[:shopping_list][:shopping_list_id])
		@shopping_list.bulk_create_ingredients(Recipe.ingredients_list(params[:shopping_list][:recipe_id]))
		
		redirect_to shopping_list_path(@shopping_list)
	end

	def text
		@shopping_list = ShoppingList.find(params[:shopping_list][:text])
		list = @shopping_list.list
		@client = Twilio::REST::Client.new
		@client.messages.create(
			from: '+17206135789',
			to: "+1" + "#{params[:shopping_list][:phone_number]}",
			body: list.join(" ")
			)
		redirect_to :back
	end

	private

	def authorize
		if current_user.nil?
			redirect_to root_path
			flash[:alert] = "You are not authorized to visit this page"
		end
	end

	def shopping_list_params
		params.require(:shopping_list).permit(:name, :user_id)
	end
end
