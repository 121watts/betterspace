Rails.application.routes.draw do

  get 'signup', to: 'sessions#new',     as: 'signup'
  get 'login',  to: 'sessions#new',     as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions
  resources :users

  get 'auth/:provider/callback', to: 'sessions#create_github'
  get 'auth/failure', to: redirect('/')

  root to: 'sessions#new'

end
