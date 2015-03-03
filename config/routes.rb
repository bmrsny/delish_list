Rails.application.routes.draw do
	root "welcome#index"
	get '/auth/:provider/callback', to: 'sessions#create'
	get 'logout', to: "sessions#destroy", as: :logout
	get 'about', to: 'static_pages#about', as: :about
	get 'recipe', to: 'static_pages#recipe', as: :recipe
end
