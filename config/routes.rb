Rails.application.routes.draw do
 
 get '/services', to: 'services#index_all'
 root 'home#index'

devise_for :users, controllers: {registrations: 'registrations'}, :path_prefix => 'my'

	resources :users do 
		resources :services 
	end
end
