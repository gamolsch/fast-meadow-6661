Rails.application.routes.draw do

  resources :storages
  resources :items

  get '/home', to: 'users#home'
  get '/storages', to: 'storages#index'
  root 'welcome#index'
end
