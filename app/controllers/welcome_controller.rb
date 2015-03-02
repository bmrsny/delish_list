class WelcomeController < ApplicationController
	def index
		flash[:success] = "Whooo You Did It Bruh!"
	end
end
