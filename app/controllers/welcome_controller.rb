class WelcomeController < ApplicationController
	def index
		flash[:alert]  = "You Have Some Errors Bruh!"
		flash[:success] = "Whooo You Did It Bruh!"
	end
end
