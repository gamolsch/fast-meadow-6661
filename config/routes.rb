Rails.application.routes.draw do
  root 'users#home'

  resources :storages
  resources :items
  resources :transaction
  resources :search, path: 'api/items'

  get '/search', to: 'search#main'
end
