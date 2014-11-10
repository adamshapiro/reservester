Rails.application.routes.draw do
  get 'sessions/new'

  resources :users

  resources :restaurants

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get 'reserve' => 'reservations#new'
  post 'reserve' => 'reservations#create'
  delete 'reserve' => 'reservations#destroy'

  root to: 'restaurants#index'
end
