Rails.application.routes.draw do

  resources :storages
  resources :items
  resources :transaction

  root 'welcome#index'
end
