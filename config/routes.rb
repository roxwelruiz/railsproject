Rails.application.routes.draw do
  
  resources :products
  resources :orders, only: [:index, :show, :create, :destroy]

  root 'static_pages#index'
  #root 'static_pages#preindex'

  get '/main', to: 'static_pages#go_to_main'
  get '/index', to: 'static_pages#index'
  get '/about', to: 'static_pages#about'
	get '/contact', to: 'static_pages#contact'

	#get '/message_sent', to: 'static_pages#message_sent'
	post '/message_sent', to: 'static_pages#message_sent'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
