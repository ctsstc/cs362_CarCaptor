# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'rootcontroller#index'
  resources :ownedcars
  resources :garages
  resources :cars
  get '/profile', to: 'profile#index'
  get '/profile/add-car'
  get '/profile/challenge'
  post '/profile/commence_challenge'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
