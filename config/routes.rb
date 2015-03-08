Rails.application.routes.draw do
	root "welcome#index"
	get '/auth/:provider/callback', to: 'sessions#create'
	get 'logout', to: "sessions#destroy", as: :logout
	get 'about', to: 'static_pages#about', as: :about
	resources :recipes, only:[:index, :show]
	resources :shopping_list
	post "text_me", to: "shopping_list#text" 
end
