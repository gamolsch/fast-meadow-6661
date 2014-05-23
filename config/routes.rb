Rails.application.routes.draw do

  resources :storages
  resources :items

  get '/home', to: 'users#home'
  get '/storages', to: 'storages#index'
  get '/storages/1', to: 'storages#show'

  root 'welcome#index'
end
