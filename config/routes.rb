Rails.application.routes.draw do

  resources :storages
  resources :items
  resources :transaction

  # Used for testing purposes
  get '/api', to: 'api#index'

  get '/home', to: 'users#home'
  get '/storages', to: 'storages#index'
  get '/storages/1', to: 'storages#show'
  get '/items/new', to: 'items#new'
  get '/items/1', to: 'items#show'

  #AngularJS entry-point:
  get '/search', to: 'search#search'

  root 'welcome#index'
end
