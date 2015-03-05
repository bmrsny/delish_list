class ShoppingListController < ApplicationController
	before_filter :authorize
	
	def index
	end
	private

	def authorize
    if current_user.nil?
			session[:last_page] = request.referer 
		  redirect_to root_url, alert: "Must be logged in."
		end
	end
end
