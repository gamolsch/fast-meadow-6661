Rails.application.routes.draw do
  root 'users#home'

  resources :storages
  resources :items
  resources :transaction
  resources :search, path: 'api/items'
  post '/items/ajaxget', to: 'items#ajaxget'
  get '/search', to: 'search#main'
end
