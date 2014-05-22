Rails.application.routes.draw do

  resources :storages
  resources :items

  root 'welcome#index'
end
