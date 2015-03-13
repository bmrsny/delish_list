class TextMessagesController < ApplicationController
	
	def create
		@shopping_list = ShoppingList.find(params[:shopping_list][:text])
		list = @shopping_list.ingredients.map do |ingredient|
			"Name: #{ingredient.name}\n #{ingredient.quantity}, #{ingredient.unit}\n"
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
			redirect_to shopping_list_path(@shopping_list.id)
	end
end
