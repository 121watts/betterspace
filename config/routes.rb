Rails.application.routes.draw do

  get 'signup', to: 'sessions#new',     as: '/'
  get 'login',  to: 'sessions#new',     as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions,   only: [:new, :destroy]
  resources :users,      only: [:new, :index] 
  resources :complaints, only: [:index]

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure',            to: redirect('/')

  root to: 'sessions#new'

end
