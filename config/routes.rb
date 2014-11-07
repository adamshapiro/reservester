Rails.application.routes.draw do
  get 'sessions/new'

  resources :users

  resources :restaurants

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  root to: 'restaurants#index'
end
