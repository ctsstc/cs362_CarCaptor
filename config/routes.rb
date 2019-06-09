# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'rootcontroller#index'
  resources :ownedcars
  resources :garages
  resources :users
  resources :cars
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'users/:id/add' => 'users#add'
  get 'garages/:id/add' => 'garages#add'
end
