Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "restaurants#index"

  get 'users/new', to: 'users#new'
  get 'users/index', to: 'users#index'
  post 'users/create', to: 'users#create'

  get 'session/new', to: 'session#new'
  post 'session/create', to: 'session#create'
  post 'session/destroy', to: 'session#destroy'

  get 'restaurants/index', to: 'restaurants#index'
  get 'restaurants/all', to: 'restaurants#all'
  get 'restaurants/show', to: 'restaurants#show'
  post 'restaurants/create', to: 'restaurants#create'
  post 'restaurants/update', to: 'restaurants#update'
  get  'restaurants/food_items', to: 'restaurants#food_items'
  get 'restaurants/search', to: 'restaurants#search'

  post 'food_items/add', to: 'food_items#add'
  post 'food_items/change_item_lock', to: 'food_items#change_item_lock'
  post 'food_items/delete', to: 'food_items#delete'
  post 'food_items/update', to: 'food_items#update'

  get 'orders/index', to: 'orders#index'

  get 'emails/index', to: 'emails#index'
  get 'emails/preview', to: 'emails#preview'
  post 'emails/send_email', to: 'emails#send_email'

  get 'roles/index', to: 'roles#index'
  post 'roles/change', to: 'roles#change'

end
