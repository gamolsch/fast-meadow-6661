Rails.application.routes.draw do
  root 'users#home'
  get '/dashboard', to: 'users#dashboard'

  resources :storages
  resources :items
  resources :search, path: 'api/items'
  resources :transaction
end
