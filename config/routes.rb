Rails.application.routes.draw do
	root "welcome#index"

	get 'about', to: 'static_pages#about', as: :about
end
