Rails.application.routes.draw do
	root "welcome#index"

	get 'about', to: 'static_pages#about', as: :about
	get 'recipe', to: 'static_pages#recipe', as: :recipe

end
