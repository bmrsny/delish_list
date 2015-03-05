class SessionsController < ApplicationController
  def create
  	 user = User.find_or_create_from_auth(auth)
     if user
       session[:user_id] = user.id
			 user.save
			 flash[:success] = "Successful Login."
			 if session[:last_page]
         redirect_to session[:last_page]
			 else
				 redirect_to root_path
			 end
     else
			 flash[:error] = "You could not be logged in."
       redirect_to rooth_path
     end
	 end

	def destroy
		session.clear
		flash[:success] = "Successful Logout"
		redirect_to root_path
	end

	private 

	def auth
		request.env['omniauth.auth']
	end
end
