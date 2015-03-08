require 'twilio-ruby'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	helper_method :current_user

	private
	
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def authorize!
		redirect_to root_path unless current_user
	end

	def redirect_to_or_back
		if session[:last_page]
			redirect_to session[:last_page]
			flash[:success] = "Login in as #{current_user.name}."
		 else 
			 flash[:success] = "Logged in as #{current_user.name}."
			 redirect_to root_path
		 end
	end
end
