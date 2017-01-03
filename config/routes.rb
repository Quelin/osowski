Rails.application.routes.draw do
 
 root 'home#index'

devise_for :users, controllers: {registrations: 'registrations'}, :path_prefix => 'my'
resources :users
end
