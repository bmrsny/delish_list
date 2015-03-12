class ShoppingListController < ApplicationController
	before_filter :authorize

	def create
		require "pry" 
		 binding.pry
		@shopping_list = current_user.shopping_lists.create(name: params[:shopping_list][:name])	
		@ingredients = Recipe.ingredients_list(params[:shopping_list][:recipe_id])
		#@ingredients = params[:shopping_list][:ingredient].map do |ingredient_id|
			#@shopping_list.ingredients << Ingredient.find_by(id: ingredient_id.to_i)
		#end

		redirect_to shopping_list_path(@shopping_list)
	end
	
	def show
			@shopping_list = ShoppingList.find(params[:id])
			#@ingredients = @shopping_list.ingredients
			@ingredients = Recipe.ingredients_list(params[:recipe_id])
	end

	def update 
		@shopping_list = current_user.shopping_lists.find(params[:shopping_list][:shopping_list_id])
		if params[:shopping_list][:ingredient] 
			@ingredients = params[:shopping_list][:ingredient].map do |ingredient_id|
			@shopping_list.ingredients << Ingredient.find_by(id: ingredient_id.to_i)
			end
		end
		redirect_to shopping_list_path(@shopping_list)
	end

	def text
		@shopping_list = ShoppingList.find(params[:shopping_list][:text])
		list = @shopping_list.ingredients.map do |ingredient|
			"Name: #{ingredient.name}\n #{ingredient.quantity} #{ingredient.unit}\n" 
		end

			Twilio.configure do |config|
  			config.account_sid = ENV['TWILIO_SID']
				config.auth_token = ENV['TWILIO_TOKEN'] 
			end
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
