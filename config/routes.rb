Rails.application.routes.draw do
  devise_for :users
  root "todos#index"

    resources :todos, except: [:show]do
      collection do
        get :deadline
        get :done_index
      end
      member do
        get :search
        post :done
        post :done_back
      end
    end
    
  resources :users, only: [:edit, :update] 
end
