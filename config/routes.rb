Rails.application.routes.draw do
  get '/' => 'rootcontroller#index'
  resources :ownedcars
  resources :garages
  resources :users
  resources :cars
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'users/:id/add' => "users#add"
end
