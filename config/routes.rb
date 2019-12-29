Rails.application.routes.draw do
  get 'contexts/index'
  devise_for :users
  root "todos#index"
  resources :todos
  resources :projects, only: [:index, :show]
  resources :users, only: [:edit, :update] 
end
