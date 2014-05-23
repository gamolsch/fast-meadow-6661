Rails.application.routes.draw do

  resources :storages
  resources :items
  resources :transactions

  root 'welcome#index'
end
