Rails.application.routes.draw do

 get '/services', to: 'services#index_all'
 root 'home#index'

devise_for :users, controllers: {registrations: 'registrations'}, :path_prefix => 'my'

	resources :users do 
		resources :services 
	end

	resources :services do 
		resources :invoices 
	end

	 resources :services do
  	 	resources :packages
	end

	resources :contacts, only: [:new, :create]
	resources :messages, only: [:new, :create]
	resources :infos, only: [:new, :create]


end
