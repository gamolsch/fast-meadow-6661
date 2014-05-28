Rails.application.routes.draw do
  root 'users#home'
  get '/dashboard', to: 'users#dashboard'
  get '/search', to: 'search#main'

  resources :storages
  resources :items
  resources :transaction
  resources :search, path: 'api/items'

  post '/items/ajaxget', to: 'items#ajaxget'

end
