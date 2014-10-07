require 'api_constraints'

Rails.application.routes.draw do


  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :complaints
    end
  end

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
