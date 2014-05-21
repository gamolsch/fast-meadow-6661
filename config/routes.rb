Rails.application.routes.draw do
  resources :storages

  root 'welcome#index'
end
