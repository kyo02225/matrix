Rails.application.routes.draw do
  devise_for :users
  root "todos#index"

    resources :todos, except: [:show]do
      collection do
        get :deadline
      end
      member do
        post :done
      end
    end
  
  resources :contexts, only: [:index, :show]
  resources :projects, only: [:index, :show]
  resources :users, only: [:edit, :update] 
end
