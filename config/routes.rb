require 'api_constraints'
require 'resque/server'

Rails.application.routes.draw do


  mount Resque::Server.new, at: "/resque"

  namespace :api, defaults: {format: 'json'} do
    namespace :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :complaints, only: [:index, :show]
    end
  end


  get 'contacts', to: 'contacts#new',     as: 'contact'
  get 'signup',   to: 'sessions#new',     as: '/'
  get 'login',    to: 'sessions#new',     as: 'login'
  get 'logout',   to: 'sessions#destroy', as: 'logout'

  resources :contacts,   only: [:new, :create]
  resources :sessions,   only: [:new, :destroy]
  resources :users,      only: [:new, :index]
  resources :complaints, only: [:index]
  resources :api_keys,   only: [:index, :create, :destroy]

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure',            to: redirect('/')

  root to: 'sessions#new'

end
