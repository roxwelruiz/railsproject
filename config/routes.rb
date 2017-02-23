Rails.application.routes.draw do
  
  resources :products
  resources :orders, only: [:index, :show, :create, :destroy]

  #root 'static_pages#index'
  root 'static_pages#landing_page'

  get '/about', to: 'static_pages#about'
	get '/contact', to: 'static_pages#contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
