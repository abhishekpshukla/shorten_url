Rails.application.routes.draw do
	resources :url_shortens, only: [:index, :create]

  devise_for :users
  root to: 'visitors#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
