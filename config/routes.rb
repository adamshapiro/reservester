Rails.application.routes.draw do
  root to: 'restaurants#index'

  get 'sessions/new'

  resources :users

  resources :restaurants

  get 'dashboard' => 'users#dashboard'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get 'reserve' => 'reservations#new'
  post 'reserve' => 'reservations#create'
  delete 'reserve' => 'reservations#destroy'

end
