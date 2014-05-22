Rails.application.routes.draw do

  resources :storages
  resources :items

  get '/home', to: 'users#home'

  root 'welcome#index'
end
