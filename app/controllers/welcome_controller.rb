class WelcomeController < ApplicationController
	def index
		flash[:notice]  = "what the fuck is happening"
	end
end
