Rails.application.routes.draw do
  resources :items, only: [:index]
  resources :users, only: [:show]
  get '/users/:user_id/items', to: 'users#items_index'
  get '/users/:user_id/items/:item_id', to: 'users#item_show'
  post '/users/:user_id/items', to: 'users#item_create'
end
