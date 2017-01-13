Rails.application.routes.draw do
 
  resources :services
 root 'home#index'

devise_for :users, controllers: {registrations: 'registrations'}, :path_prefix => 'my'
resources :users
end
