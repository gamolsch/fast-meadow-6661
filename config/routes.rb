Rails.application.routes.draw do

  resources :storages
  resources :items

  get '/home', to: 'users#home'
  get '/storages', to: 'storages#index'
  get '/storages/1', to: 'storages#show'
  get '/items/new', to: 'items#new'
  get '/items/1', to: 'items#show'

  root 'welcome#index'
end
