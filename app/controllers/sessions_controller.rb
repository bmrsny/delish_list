class SessionsController < ApplicationController
  def create
  	 user = User.find_or_create_from_auth(auth)
     if user
       session[:user_id] = user.id
       redirect_to root_path
     else
       redirect_to rooth_path
     end
	 end

	private 

	def auth
		request.env['omniauth.auth']
	end
end
