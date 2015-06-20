Rails.application.routes.draw do
  resources :messages

  get '/' => 'sessions#new'

  get 'singup' => 'users#new'
  resources :users

  get 'login' => 'sessions#new', as: :login
  post 'login' => 'sessions#create'
  delete 'delete' => 'sessions#destroy', as: :logout
end