Rails.application.routes.draw do
  get 'contexts/index'
  get 'projects/index'
  devise_for :users
  root "todos#index"
  resources :todos
  resources :users, only: [:edit, :update] 
end
